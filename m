Return-Path: <linux-arm-msm+bounces-95069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CQLA9OepmlqRwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:41:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2311EAE94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EAF63062F86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7D6388363;
	Tue,  3 Mar 2026 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPu0IvLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fE7/QIUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D195338839D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527279; cv=none; b=e3I2W85KIl7tnhkCslGOsuHE35iopyNUmD03WkrwpIryDW5hhSeuRBlUGaIcgdFB6tuaL5esFvFqw/JTRdWHDqnCXoKsw9CL+gVL2qgwqu/2Sqbm24ZMJIkDj07d/wyfbSQcsOSJA6r/IWIOvbIfzVXBqC/eWovlmFocIcv+AYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527279; c=relaxed/simple;
	bh=SdU36b6TYV79uk+gjgvtozaaDb08vZT9Ub4z3hYO0VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfgmoCH6jW2MazuHHU59W7kqVP1DDj/ZuotRugetYpLvO7fjQqsAmfzIQAijswXIxoFafV4LZBmnvyjkci/0/k0KO43bC7PyjhMG69D/UtsdtqtxhvvD7oxfVTaraO1jfSihcUhavzl52DCOJ4yzcBNNEtJTFy0UH5ma/e5ut3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPu0IvLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fE7/QIUH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236P4UI959358
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3P/v9Y/3o9NF1GSXcnB18lWN7UL+yS3drdaJoZ7Zyg=; b=lPu0IvLOPOGEumFw
	NtZX6jW8VhXAyjfau3IS3LNUEW7d7EWpEsdWvSM3il4/BOPUe3Im5W7DwNeweikt
	oLmkaboeM0PZu1PZZl2uH7vn262sJSDP02HGy+g3mAE+kN0H6qwBTIsUiBTGIcjt
	XlDYimgHcj9zT+lmR0gxwwX+cF5ENjStbMmsdcLKcRew8mWTqriIOtyLUdDeeLtF
	nb6qCOHWMMeHBvrP3QsxpktB/b+lAKS13XYsb6XMDPI4l/ZlUHQ5pYWJ3D8rcEOi
	XK2Lp6Avs+V+X9v1PgNIYqVv7fQsdFiHTp5YLNeRYVXz5DixjMWKTNEi8e3r6Grk
	ZxfxbQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5a27x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:41:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso26131135a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772527276; x=1773132076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3P/v9Y/3o9NF1GSXcnB18lWN7UL+yS3drdaJoZ7Zyg=;
        b=fE7/QIUHs7edvxvjpqFT74zHbajbsJE/HGWi3TDwY1nTAfIM/AFONu8AWEd2nkJNKA
         uTcgcjYgzaDr+jiLMuJWfw3EuxUudO3oCueyumYsEFSMNwueHUSDkTd1y3JvMS65BAuC
         TiUhanU6lIMXYWeEE0ocyhm/zaEt7FTY4tWPAhr4v/+UwH4HrjKeowPanydlN0rbrHX2
         21+EK7GUVeBrIkh1XW1hQqnJ2N39oQQ2xMVCnX+kbegG5mAPW6CgyhwT5AO2gXxkCK32
         zBGYCcVXa/Nwa7c6EEUSxMX7akAfRy4CuyN/XdS+cG9KDkYckzyqLYhE1jCvASDF8pP3
         h2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527276; x=1773132076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3P/v9Y/3o9NF1GSXcnB18lWN7UL+yS3drdaJoZ7Zyg=;
        b=wIzDYXSYKvr9UAkMODGh1P53SpglNju6zG/5WNZT63zp39/6VqiK0/UIEvRix+ujEF
         ucklb109taHZcykvDtbP90li+gyRVyi6+DhCiQI3YrNm/eHOYPnhM9sAm/8fl0f1F0t+
         bTr6B0tM2lOZJMbNOpTGej3p/w9yOwe/yz9FWhdTKTUUXElvqbR91KzzzuvEuTf8Hro5
         PBIDH648arQO/26GMCqZ+K1Pct2H8GkZKr06NnoThbS37BxhBg9ZfnUb3UFg2NN3TuP+
         C7Jdy5OxOrUBF0fhOG0kcBbuzZKQlev+/s62/L1rVpAHyj0AHrTchWOoJlY4nTkgk/t/
         8ieQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+NWTZRP8mTHiXmx04OhydnkrjPq6mINudd0fnXOhq6DsqTdmMylsrBXvNbZI0zQ2+Ytt45zV/I0kxuqG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0Cxyre104sUb/PJTZlZ1sEIH0RuCaEaURkjD5sK1TBEmjw/X
	VA5O/AvbEA62LAfKj+hIp5c/mmgbJ6GbmvGD6nn+SwaA6ryKBfBmkoPGIjF6KpVJ11WTTR18Gir
	+KeO9G4IwGVHLobhJfHv4eecb29OtuxF99LcVc2c1HoH/3Zt5NZi0LvtvhvjqYsTvHo+j
X-Gm-Gg: ATEYQzy2y12+hMcdJKpVIAVQru3z8Ihxt3HdHk+7F9VFB+XxSp8ZAQhJry7zQaRsmGw
	WZY6q1t/CPxObUbwYxQ4YzKgJ32BtOiLa8Bp/CXnEVLVq9u02OLsrcKURPs7tFOcasqD7JGvUSa
	Y9HQg82HBjY5NY8cmFTUbl/4zQal7v/eTodZaRGjyD8V/axbAasIzkoALtZ236UZIgKudB37gO8
	GM718HYpPO1SGU1aPbsdeiXVjevjfb97pMTUcZkAc30IZqXe3Bx6k928FD7B52gtiYf8S9hHWWx
	+VZOnadcwQ/8XUFbGdvrfbkvygo5EibtZfZV3PYkuH6WcEwIixn+YidABxt3xSN3QmX9SGLhRKV
	cXsnf3mV1WRJ53DMyINU+7KpIzbntczVx4BJ0nwaORanLnH6eOcbHvbkBm5ludkI9Yr+kwrRTst
	boCaZEzZwsBQIM
X-Received: by 2002:a05:6a21:b82:b0:35f:5fc4:d885 with SMTP id adf61e73a8af0-395c3a1d040mr12820062637.9.1772527275737;
        Tue, 03 Mar 2026 00:41:15 -0800 (PST)
X-Received: by 2002:a05:6a21:b82:b0:35f:5fc4:d885 with SMTP id adf61e73a8af0-395c3a1d040mr12820039637.9.1772527275070;
        Tue, 03 Mar 2026 00:41:15 -0800 (PST)
Received: from ?IPV6:2401:4900:1c66:bc62:9072:7b6b:889e:887d? ([2401:4900:1c66:bc62:9072:7b6b:889e:887d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa620faesm13260917a12.10.2026.03.03.00.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 00:41:14 -0800 (PST)
Message-ID: <b32c7091-b2c4-443d-b58e-759b471f67db@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 14:11:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and clock
 voting calls for ICE
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni
 <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
 <vimd3tbnu4mr2uqporj7d4fv23aq2cb6e5een43yz5spe4u2xx@ufyzb2lzlc6j>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <vimd3tbnu4mr2uqporj7d4fv23aq2cb6e5een43yz5spe4u2xx@ufyzb2lzlc6j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2MyBTYWx0ZWRfX5/cgDIAi8y8w
 cKrnuIkj3weKNUGO6w1qamF835FMQhNVdwzryKChLXTeQG6ulhaCeFAf0Ul4j329J8YXF6GYChF
 Qz2PZN5dBbNwH1ZQhiB6feXC8KDbKyzYOHVH+yD7nCDQOPkfOOpnNTrqTHuzxq5aVAGrVOXqe0s
 PDMP3jXsnMEW5npxFOSQoXpde+7l9PNZZ2tLA+IpkunPWnFt0t7jYAgtDTXcmC/4JkYJ+YO568n
 fnpTy+OkFo8iLHXnFzZPit029STp71iNkFP1m7O9qbqYUuRgD/u1yXTp6HFl29uGQl2k0lQqVYA
 1N+Ghcgqs/LgaHFNTiWWaCXdUuwBfPAOtLjfT1LOZQ6/yH93Z0crA5k8n5ei1VGYxmOz7hgHeMs
 leV6Yuzc0uZ56ICSyg7qIxyUup3gjMsRUrnTsHQll2TQ2XyPx9lZB52dvGhhU9sYg20WrT78o1u
 ZK2YF1AuMUDV72Z1GJg==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a69eac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=dxsIoiN5mY1GeC2t4AAA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ZLkmdKWj5pd7NmM5BANBZvfyQ8lvCNvC
X-Proofpoint-ORIG-GUID: ZLkmdKWj5pd7NmM5BANBZvfyQ8lvCNvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030063
X-Rspamd-Queue-Id: 9F2311EAE94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95069-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Manivannan,

On 2/20/2026 8:14 PM, Manivannan Sadhasivam wrote:
> On Fri, Jan 23, 2026 at 12:41:35PM +0530, Harshal Dev wrote:
>> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
>> de-coupled from the QCOM UFS driver, it should explicitly vote for it's
>> needed resources during probe, specifically the UFS_PHY_GDSC power-domain
>> and the 'core' and 'iface' clocks.
> 
> You don't need to vote for a single power domain since genpd will do that for
> you before the driver probes.
>

Unfortunately, without enabling the power domain during probe, I am seeing occasional
clock stuck messages on LeMans RB8. Am I missing something? Could you point me to any
docs with more information on the the genpd framework?

Logs for reference:

[    6.195019] gcc_ufs_phy_ice_core_clk status stuck at 'off'
[    6.195031] WARNING: CPU: 5 PID: 208 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x174/0x18c

[...]

[    6.248412] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.248415] pc : clk_branch_toggle+0x174/0x18c
[    6.248417] lr : clk_branch_toggle+0x174/0x18c
[    6.248418] sp : ffff80008217b770
[    6.248419] x29: ffff80008217b780 x28: ffff80008217bbb0 x27: ffffadf880a5f07c
[    6.248422] x26: ffffadf880a5c1d8 x25: 0000000000000001 x24: 0000000000000001
[    6.248424] x23: ffffadf8a0d1e740 x22: 0000000000000001 x21: ffffadf8a1d06160
[    6.248426] x20: ffffadf89f86e5a8 x19: 0000000000000000 x18: fffffffffffe9050
[    6.248429] x17: 000000000404006d x16: ffffadf89f8166c4 x15: ffffadf8a1ab6c70
[    6.347820] x14: 0000000000000000 x13: ffffadf8a1ab6cf8 x12: 000000000000060f
[    6.355145] x11: 0000000000000205 x10: ffffadf8a1b11d70 x9 : ffffadf8a1ab6cf8
[    6.362470] x8 : 00000000ffffefff x7 : ffffadf8a1b0ecf8 x6 : 0000000000000205
[    6.369795] x5 : ffff000ef1ceb408 x4 : 40000000fffff205 x3 : ffff521650ba3000
[    6.377120] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000928dd780
[    6.384444] Call trace:
[    6.386962]  clk_branch_toggle+0x174/0x18c (P)
[    6.391530]  clk_branch2_enable+0x1c/0x28
[    6.395644]  clk_core_enable+0x6c/0xac
[    6.399502]  clk_enable+0x2c/0x4c
[    6.402913]  devm_clk_get_optional_enabled+0xac/0x108
[    6.408096]  qcom_ice_create.part.0+0x50/0x2fc [qcom_ice]
[    6.413646]  qcom_ice_probe+0x58/0xa8 [qcom_ice]
[    6.418384]  platform_probe+0x5c/0x98
[    6.422153]  really_probe+0xbc/0x29c
[    6.425826]  __driver_probe_device+0x78/0x12c
[    6.430307]  driver_probe_device+0x3c/0x15c
[    6.434605]  __driver_attach+0x90/0x19c
[    6.438547]  bus_for_each_dev+0x7c/0xe0
[    6.442486]  driver_attach+0x24/0x30
[    6.446158]  bus_add_driver+0xe4/0x208
[    6.450013]  driver_register+0x5c/0x124
[    6.453954]  __platform_driver_register+0x24/0x30
[    6.458780]  qcom_ice_driver_init+0x24/0x1000 [qcom_ice]
[    6.464229]  do_one_initcall+0x80/0x1c8
[    6.468173]  do_init_module+0x58/0x234
[    6.472028]  load_module+0x1a84/0x1c84
[    6.475881]  init_module_from_file+0x88/0xcc
[    6.480262]  __arm64_sys_finit_module+0x144/0x330
[    6.485097]  invoke_syscall+0x48/0x10c
[    6.488954]  el0_svc_common.constprop.0+0xc0/0xe0
[    6.493790]  do_el0_svc+0x1c/0x28
[    6.497203]  el0_svc+0x34/0xec
[    6.500348]  el0t_64_sync_handler+0xa0/0xe4
[    6.504645]  el0t_64_sync+0x198/0x19c
[    6.508414] ---[ end trace 0000000000000000 ]---
[    6.514544] qcom-ice 1d88000.crypto: probe with driver qcom-ice failed
 
>> Also updated the suspend and resume callbacks to handle votes on these
>> resources.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> 
> Where is the Fixes tag?

Ack, I will add it in v2 of this patch.

> 
>> ---
>>  drivers/soc/qcom/ice.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index b203bc685cad..4b50d05ca02a 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -16,6 +16,8 @@
>>  #include <linux/of.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>>  
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  
>> @@ -108,6 +110,7 @@ struct qcom_ice {
>>  	void __iomem *base;
>>  
>>  	struct clk *core_clk;
>> +	struct clk *iface_clk;
>>  	bool use_hwkm;
>>  	bool hwkm_init_complete;
>>  	u8 hwkm_version;
>> @@ -310,12 +313,20 @@ int qcom_ice_resume(struct qcom_ice *ice)
>>  	struct device *dev = ice->dev;
>>  	int err;
>>  
>> +	pm_runtime_get_sync(dev);
> 
> This is not needed as the power domain would be enabled at this point.

Would this be enabled due to the genpd framework? I am not observing that
during probe. Because this call is made by the UFS/EMMC driver, perhaps you
mean the situation at this point is different?

> 
>>  	err = clk_prepare_enable(ice->core_clk);
>>  	if (err) {
>>  		dev_err(dev, "failed to enable core clock (%d)\n",
>>  			err);
>>  		return err;
>>  	}
>> +
>> +	err = clk_prepare_enable(ice->iface_clk);
>> +	if (err) {
>> +		dev_err(dev, "failed to enable iface clock (%d)\n",
>> +			err);
>> +		return err;
>> +	}
> 
> Use clk_bulk API to enable all clocks in one go.

Ack, I'll use clk_bulk_prepare_enable().

> 
>>  	qcom_ice_hwkm_init(ice);
>>  	return qcom_ice_wait_bist_status(ice);
>>  }
>> @@ -323,7 +334,9 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>>  
>>  int qcom_ice_suspend(struct qcom_ice *ice)
>>  {
>> +	clk_disable_unprepare(ice->iface_clk);
> 
> Same here.

Ack, clk_bulk_disable_unprepare() would look good.
As Konrad pointed out, if iface clock is not present in DT, thse APIs are
fine with NULL pointers here.

> 
>>  	clk_disable_unprepare(ice->core_clk);
>> +	pm_runtime_put_sync(ice->dev);
> 
> Not needed.
> 
>>  	ice->hwkm_init_complete = false;
>>  
>>  	return 0;
>> @@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>  	if (IS_ERR(engine->core_clk))
>>  		return ERR_CAST(engine->core_clk);
>>  
>> +	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
>> +	if (IS_ERR(engine->iface_clk))
>> +		return ERR_CAST(engine->iface_clk);
>> +
> 
> Same here. Use devm_clk_bulk_get_all_enabled().

As per discussion on the DT binding patch, I can do this once we decide to break the
DT backward compatibility with a subsequent patch which makes both clocks mandatory.
For v2, I am planning to continue to treat the 'iface' clock as optional via
devm_clk_get_optional() API.

> 
>>  	if (!qcom_ice_check_supported(engine))
>>  		return ERR_PTR(-EOPNOTSUPP);
>>  
>> @@ -725,6 +742,9 @@ static int qcom_ice_probe(struct platform_device *pdev)
>>  		return PTR_ERR(base);
>>  	}
>>  
>> +	devm_pm_runtime_enable(&pdev->dev);
>> +	pm_runtime_get_sync(&pdev->dev);
> 
> If you want to mark & enable the runtime PM status, you should just do:
> 
> 	devm_pm_runtime_set_active_enabled();	
> 
> But this is not really needed in this patch. You can add it in a separate patch
> for the sake of correctness.

If my understanding is correct, I need to call pm_runtime_get_sync() to enable
the power domain after enabling the PM runtime to ensure further calls to enable
the iface clock do not encounter failure. Just calling devm_pm_runtime_set_active_enabled()
will only enable the PM runtime and set it's status to 'active'. It will not enable
the power domain.

Please do let me know if there is something more to this that I am missing.

Regards,
Harshal

> 
> - Mani
> 


