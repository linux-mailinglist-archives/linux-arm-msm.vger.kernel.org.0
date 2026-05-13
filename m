Return-Path: <linux-arm-msm+bounces-107418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INwpEebBBGpjNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:24:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5D538E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAB39309E6E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE95C3A71B3;
	Wed, 13 May 2026 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7liTCF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8AjoiLw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64D387345
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696370; cv=none; b=jTI5wv5wWhWUBxstgxfvFg3WJK388HF6W4KokvlIZjGNvGDDjFTripP6TkN6AXxQbf2GLWOBlCAz+mw6lNb1Ni4GTsS8P4cn/xXuL8gjPR2N69TOF403v+8Kpab5MrV8PELsV8K7KdllM69QTVC6oKwDKxvOjvFDoZttBz/WRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696370; c=relaxed/simple;
	bh=OV4PfceyG19hBTR3s6fFftTS+Jdev4XVhsmwAWPNwj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=gePTXOAXN3pS4hHBHQTQ58yjdBum9ZT7EsWkML8c9bf3FYp6/Y/Qa5bPLKfrJZz+OiD8ZgrWykDsK8i/fAW91TwV3u634fgeekeJ3wcQUEwr9hc2H15nb9nls/Lho/XQ5gas9u7yQGG5p/XJ/0LUZZFHAKhmFtAL6Q4ntJR9AWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7liTCF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8AjoiLw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCArk62965196
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2wytpUijrKO0T5ubOcr0fnwpc//VPFoJ2V9cgdQyr0=; b=U7liTCF+jEkricGz
	tIQQDX5CwfAb0PWYCyQo9gN9nOGXa/OyPq88JGhzlPTxoE1z7OIzlKxn8EoudZu9
	LVfnTCZNIwAWyctJghdVxjPt4KYW1gqa7SE1MmB/JNbWeY6tM3m1vYBDj7P9mZSI
	33C9bH+zDaJKBZCgXCDRqVKdVqcKe9mF2meOdeV6raQE1vGgmNKFfAsUJal3bSH7
	6ql83UFwZW1DiigvE3JlZ+9Y4uoKFvbz5/saWUUhbsD1y65davuYpo4Vn2kTKf9k
	paqqODdiA5sMm5oDorqHQjS6oC7uXJOdy3JH8DaJihQIgA0+A4n7zuI3uk4uSLzo
	ptX/zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5arfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:19:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3662eec51e0so4041669a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696367; x=1779301167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2wytpUijrKO0T5ubOcr0fnwpc//VPFoJ2V9cgdQyr0=;
        b=d8AjoiLwQGdmkNBLSgqGaNJYOF+ORmNJZnxhW533mBnYdYhI6HdmgYZxDDNQxnCKbQ
         vGiuQ3sFwZEDxqkjypKI8uX0nez0jvGhjKx5R8eHqOvomseiPNtFL4/baQbg6DofmETt
         jcsUii5gPb67EZgHE7hT34t4k57o67y/BhdLA4vLL6fTbXNsu02SrzQZp4lPv2HVoVKp
         X/qk1spmtrAO7RNBnDijcL4HGb6Zcc8VKZRRoMb8So09KjY2xtutjzlwAk6jFqB+H+fn
         Bm+vYloTbF8F0I/CklDfIjVIcOxvyhp6iFT+q0a6cBbrES8D+O+dfuGTnC/agRO7HIU8
         rLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696367; x=1779301167;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2wytpUijrKO0T5ubOcr0fnwpc//VPFoJ2V9cgdQyr0=;
        b=kERBFwg4IYZ9u4jEsDpu9AZ/nkdAfOMwy1DtShLLzBhm5TWVegJo/bAyXfUnvH3edS
         4X2cQMNVrZglp2tZVnfZXE2SWbHWksSfwDJxQ3BdxGa7M1NhQFXj1LfsddJj4fRMQ0AR
         XETF5T6OWP7UgQE7ArHTrG4sRhVZd0Wf5Q/LqXpMK1n1N2PgsKGmj67P5gLL4GgzXh/M
         zHaDGsmY1UUbum/TScZYBFrN6KTAPDS5HxnNH3RilR7zVtmiHZ+ug7WPvQydLjzahtn0
         XPfiD3ALHxGouDnNCqZPJxP5Nr/dq5fOAW8K1HBi0q7GUFElx/eu7LE6b+j+daJo4NYp
         248A==
X-Forwarded-Encrypted: i=1; AFNElJ/pssETinyWJEqqjsicwNbeWnTlcApliTC14OAfqTsrw9Sl0Ai5aPpxmnm94ujHWoqhjlXaA5taVolP4oYw@vger.kernel.org
X-Gm-Message-State: AOJu0YydZrvlXgd4I+Q6ntRd1dNpJWwX96RkHZ1YWT8ZjJtbzI9Tpbma
	Pyg/mDVgJyOsifGrOupJfedeEIRzs5o9NjRpuysqqYPB03R0kP2+giIbNISKyDHF4Lj4sERH4yb
	4GSoVGxd0kCids7YybkJmMXWl595kYpjnDUOqn1atydTkYEmQV4FoqPgfJzShSzBArYd4
X-Gm-Gg: Acq92OHBoZS6tb9sB0SklXsh3yVTiOD1I5juKDCKMcQ6RE8C3eFy4Q6Xuj7qQ/GmVng
	GAM9K5sWkMFAil00hmsTjK5lJqtnPE20wWPKqdwuPb8haRfId+NpBJBv35xV6ztpw1sHgiCoC4I
	G7wUM2hKzwkCx06RdWln9V4JmliHNBs5jVw+1LLU/yo0wTTXSf5M/lJ+PBbLmu2t6XrpSeKQ5NU
	z8oHxxlsHvdmKnt7imd+5Ms1R2ZM1Al5QugvRjiNRSWrQJcY3MmAxVxVKQGfDjR3jVsOKh0QXcu
	QloIsBw0gxwPaY8MetdUFBEW3Osq4ECCQkSSaFgBOCrdv1Mu1KrmqlJJeYkrq5bx2iYRlKZLNzV
	0doeaVvwP2CMWRMbuPj75JAJTIUw2zmVfxzt4xdJUsTy9u4ibcJNZ3rqsL9+QPg==
X-Received: by 2002:a05:6a20:3d22:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-3afb1a0a4fbmr4184396637.40.1778696366908;
        Wed, 13 May 2026 11:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d22:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-3afb1a0a4fbmr4184362637.40.1778696366337;
        Wed, 13 May 2026 11:19:26 -0700 (PDT)
Received: from [192.168.0.110] ([183.82.29.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826768acf3sm18897017a12.10.2026.05.13.11.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:19:25 -0700 (PDT)
Message-ID: <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
Date: Wed, 13 May 2026 23:49:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
To: Bjorn Andersson <andersson@kernel.org>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MiBTYWx0ZWRfXyFpIQ4lNchH5
 3xNl9uYhLtgytYaoRDy6AX6ajJv0NwD68UL60x1k0w55WqYj86RpI49i8WVTo31lYqpiSKhp+YB
 4lP8HoNyiGLOgCHv14njgr5kCgh9ITmNoVbYs8n3HHy+INnHt+LvX+JMbX+D8mJoE1PKw+8KedI
 nf2GWS2J38AG8u0yiWVZjnEnjJ8zfHPpxFiy0esx5YguXUgSxi98N+HmxLV5w0h0vecTPaX7QvR
 GV92CZGL59j0/JGuHNTtjLkCutorlinLlgaVIKNmG5lusqfmv4dbX597FhWexcBjRargMou+iUa
 MQ9E10TSo7mOzozyW6k6qDFBV5ZO+Ba86IH77ErerG4hq2eoCYSzJdLyLktaUzmbLFG9YGfmrZj
 x72i+r5axeXR9xSHvRSdZVx7L4O/DDksWsE8YXaD2TEK8xpR6XMZrzZolcxIgO2Audh7Pj8zMv6
 tcF98ycdvCgZQ9brJVw==
X-Proofpoint-ORIG-GUID: AjfGsovIHoaP_HbvlZdu7dD5LWviQiZW
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04c0af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=zhxe3pEVf5X/RQkgbsjYTw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=2DIguSIwZBnVL4SAOv4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: AjfGsovIHoaP_HbvlZdu7dD5LWviQiZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130182
X-Rspamd-Queue-Id: D7D5D538E1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107418-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Bjorn,

A gentle reminder to review this series. All the patches have picked
up R-b tags. If it looks okay to you, could you please help pick
it up in the current merge window.

Thanks
Vignesh

On 5/5/2026 3:53 PM, Varadarajan Narayanan wrote:
> As discussed in [4] posting this series after dropping IPQ5424 support
> to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].
> 
> Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.
> 
> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> I've resumed Gokul's work as the last submission dates back April 2025.
> 
> - Secure PIL is signed, firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
> 
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
> 
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> 
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> [4]
> https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/
> 
> Changes in v12:
> 	- No code change
> 	- Rebase to ToT
> 	- Change quicinc mail ids to oss.qualcomm.com mail ids
> 	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v11:
> 	- Add R-b tags
> 	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
> 	- No change in other patches
> 	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v10:
> 	- Add R-b tags
> 	- Remove unused fields from 'struct wcss_sec'
> 	- Remove glink and ssr subdev if wcss_sec_probe() fails
> 	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v9:
> 	- Add R-b from Konrad for dts patches
> 	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
> 	- Restore clocks & clock-names in above yaml
> 	- Fix DCO on two patches
> 	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v8:
> 	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
> 		* IPQ5018 support added in v6
> 		* IPQ5424 support dropped in v8
> 		* Updated to use IPQ9574 as example
> 	- dt-bindings-check and dtbs-check passed
> 	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
> 	- Dropped changes to ipq5424.dtsi
> 	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/
> 
> Changes in v7:
> 	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
> 	- correctly sorted smp2p-wcss nodes in dtsi files
> 	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com
> 
> Changes in v6:
> 	- added patch to fix IPC register offset for ipq5424
> 	- changed phandle description for mboxes property in dt-bindings
> 	- updated bindings to define the right clocks per SoC based on
> 	  compatible. Ran make dt_binding_check for validation of all
> 	  SoCs
> 	- use of more descriptive match data property (use_tmelcom) and
> 	  added a condition in wcss_start to not error out if tmelcom
> 	  isn't used
> 	- mitigated potential off-by-one
> 	- adopted use of of_reserved_mem_region_to_resource to acquire
> 	  memory-region resource
> 	- added driver support for ipq5018 SoC
> 	- corrected size of reg properties as per Konrad's comments
> 	- added patch to bring up Q6 in ipq5018 dtsi
> 	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> 
> Changes in v5:
> 	- retained all the patches as in v3 and addressed comments in
> 	  v3.
> 	- reverted changes to dt-bindings done in v4 and retained as in
> 	  v3 and fixed firmware format from .mdt to .mbn and retained
> 	  reviewed-by.
> 	- dropped 2 patches in v4 that adds support for q6 dtb loading.
> 	  Will post them as a new series.
> 
> 	Following tests were done:
> 	- checkpatch
> 	- dt_binding_check and dtbs_check
> 	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com
> 
> Changes in v4:
>         - changed q6 firmware image format from .mdt to .mbn
>         - corrected arrangement of variable assignemnts as per comments
>           in qcom_scm.c
>         - added scm call to get board machid
>         - added support for q6 dtb loading with support for additional
>           reserved memory for q6 dtb in .mbn format
>         - updated dt-bindings to include new dts entry qcom,q6-dtb-info
>           and additional item in memory-region for q6 dtb region.
>         - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
>           Kconfig
>         - removed unwanted header files in qcom_q6v5_wcss_sec.c
>         - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
>         - added required check for using tmelcom, if available. Enabled
>           fallback to scm based authentication, if tmelcom is unavailable.
>         - added necessary padding for 8digt hex address in dts
> 	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com
> 
> 	Following tests were done:
> 	- checkpatch
> 	- kernel-doc
> 	- dt_binding_check and dtbs_check
> 
> Changes in v3:
>         - fixed copyright years and markings based on Jeff's comments.
>         - replaced devm_ioremap_wc() with ioremap_wc() in
>           wcss_sec_copy_segment().
>         - replaced rproc_alloc() and rproc_add() with their devres
>           counterparts.
>         - added mailbox call to tmelcom for secure image authentication
>           as required for IPQ5424. Added ipq5424 APCS comatible required.
>         - added changes to scm call to pass metadata size as required for
>           IPQ5332.
> 	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com
> 
> Changes in v2:
>         - Removed dependency of this series to q6 clock removal series
>           as recommended by Krzysztof
> 	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com
> 
> George Moussalem (1):
>   arm64: dts: qcom: ipq5018: add nodes to bring up q6
> 
> Manikanta Mylavarapu (4):
>   firmware: qcom_scm: ipq5332: add support to pass metadata size
>   dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
>   arm64: dts: qcom: ipq5332: add nodes to bring up q6
>   arm64: dts: qcom: ipq9574: add nodes to bring up q6
> 
> Vignesh Viswanathan (1):
>   remoteproc: qcom: add hexagon based WCSS secure PIL driver
> 
>  .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
>  drivers/firmware/qcom/qcom_scm.c              |  14 +-
>  drivers/firmware/qcom/qcom_scm.h              |   1 +
>  drivers/remoteproc/Kconfig                    |  19 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
>  include/linux/remoteproc.h                    |   2 +
>  10 files changed, 723 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 
> 
> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd


