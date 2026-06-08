Return-Path: <linux-arm-msm+bounces-111833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BrtJDm6dJmpdZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D666554BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:46:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="b/rYwJ/6";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PGilS/o2";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F34830005A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499283B47EF;
	Mon,  8 Jun 2026 10:37:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FE7397682
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:37:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915026; cv=none; b=AmsEwmVejOovwORrmRDJyRoKKcrzyRSoN+AMBKTSj6AREofi5kz/ORwrUj/aNjzc8bx4rKcRn9pEUo+dh//mgLhIxO/ZZkpBVesx07mHk1Jpkrn/Nul2X9uiN4W/g048pi2/6axMGXkm3YZLH0CZQz+ZswRNAPEznUVE+iqOWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915026; c=relaxed/simple;
	bh=aiDAVGEiUc0oYT+3S9GzOXw5GdKTypTgkU3+VwBquFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBthciBVMAx3PmByN97bhxRkoN6zE8ZNU5En1OcBrPRIEPacf8XKgN0Cew4ILTXD05Ne2hG75ZLh5CelFAK01CfZL0D6EmUIL453Fz7jIg1MceTOkAFwQHwCJIr0HVQVD2BcnrnTk9MLLWC5GID3xN6ntE6YCRKdYowIqKeaaUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/rYwJ/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGilS/o2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892L0B2677815
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5Se8C//N9UnMC3RGnV4j8r4mQ1Cde/I25SKzifZks0=; b=b/rYwJ/6vqt7glV0
	Y4RDY3zATS06Q+W95x1Qd1STh2jP/4iptX55wyZP4ccsJjxIJLw6ufYBWVyBafZZ
	YJq3tPJ+21gVf2Y/jwtauFIS8yb1eD6EdS8gyNXJjgJxRDhZtnUYv4yg0NUQLO9s
	4NO6UMO5ttmM3TghdkdZu6/dP0c8qPWqIr7IkBdpJWflEZNLxczoC55K6123LuJF
	cCkA4pKgw+tOL7Wnp4AXvdAtFjkXJDCim5HtgYuEIhCyTkXexUblsCM701UcsIgB
	0xMvK1oMOhIiuOxdePro/HYnvenBW2WgpVnajnfnpOxs7B+IrmMUe4vjuzRrZ6qz
	huHPhg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkrdpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:37:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so5258414a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915024; x=1781519824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5Se8C//N9UnMC3RGnV4j8r4mQ1Cde/I25SKzifZks0=;
        b=PGilS/o20aOLr52Vm+xY1zuK/mSEfPhQp3AOua1CEt6wFI2yl+1ictLwiAoffhyqgV
         BFEFic/41AP0TJ/O1dDu5er0fPkJ55qx5xz5T5agZeCMNgu+bQGar1CDbjc26LAaNynO
         VdV9zFkauSuvpZm8+26h12itCp+gKjpbn/Uft29b9+4Ew94HW8DvnL6o65Mg0pkdjtUt
         RFCUEVhd51KmcQfB2NDL0y4paO6IF25lITzQCX+DRQW4xBQ4BTnLU96taR76Uomt8NXz
         ICT6kMt7cUVNSZaR6DXrQwKeLJF3o5RuLq5ZjhNhIvOF3pAwY2MAJzr91i6rT6xAMvxs
         mfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915024; x=1781519824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5Se8C//N9UnMC3RGnV4j8r4mQ1Cde/I25SKzifZks0=;
        b=ocQcGb2JpHov18OmwPb0aQYO/mQBI44QrZr3MkBV4U3gipDVjRFyvnFl3jDwGynTA8
         L9oh4cx9IHPxfxo/3GWj/upfwF5JjN8F/umzJf5oa7SiJLHrQjgTaHosfVCBpxH0jJEB
         I7SM2vfzz8SEqmbVfPnqekt7TlNvNuKHeMedAA4bCQfiTetbwmA0LC25vyRcxvxG/ReH
         +4TVixgvGTNzZn2V52O1TXB7FmpRlRCe/jJ2m3RYMIuV9lW1EA3eBtXUJfFj2QRGAc1+
         IrbgeqXmTBH9M5OaUj/kXId/BJuWYfyJk3Gctdxph8YuyfV/w9lQ3ER2l8tZ8z0MAhP8
         FHsg==
X-Gm-Message-State: AOJu0YwSihX4En7ssjVBvEK/buHTEoygs8owSK+Ydu80ZYe9FmfXQAcY
	H7ox7suP+YuQRkZQTPQDpFs1NxaoNU5jrl/GdC47q4Je0v94xLhLyKRJ5lezlv1kEGslP4Luv/M
	xeauQy2nvPxr0Q2ldZAlmoDfzVytSMO4nmixPN4cNQu7qQ8OXCTrNHICY78cVNAckk628
X-Gm-Gg: Acq92OHuihJUkwQ+z4oXPB+LdVfs5E03gFGfMtkoVsaLx67uPbdFpw5cowQzSC6tVjL
	Gv95/M7P5TuGNeOE1d/8IIwbFqJcWCPvvdSKfKZ8ebXoF1XWiPGalytp0dcDFtiQ9a5tK8ZIuNi
	gwR3vsv2p5KLHabf0pC9JmTTPe+sQ3+UR28ecwgCwC/cmEzkWBacRGrIOYhqrPYy5K7qZOD45WY
	kMo82kJjG6juRFGiEzLK+gSxghuiTVSpFL9nHfSVNvZdW1XDmPwXGQJFQLibdJSA7ibNpYkJ572
	Rjl8qBrsjV7p+IRHWV91YoVhs2hAi68tXxY/RRb0MoBXynaII6QeD/WZu/C19nxb60NzN6j8nnz
	tptaNrFjn47l5JdHEa29WfrgyrH1+fprgGvliYxW69B5nPAuMvfgzwUzfEqXTb/Q=
X-Received: by 2002:a17:90a:d884:b0:36d:b680:3041 with SMTP id 98e67ed59e1d1-370ee82fb58mr14402644a91.4.1780915023693;
        Mon, 08 Jun 2026 03:37:03 -0700 (PDT)
X-Received: by 2002:a17:90a:d884:b0:36d:b680:3041 with SMTP id 98e67ed59e1d1-370ee82fb58mr14402621a91.4.1780915023259;
        Mon, 08 Jun 2026 03:37:03 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm18338118b3a.5.2026.06.08.03.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:37:02 -0700 (PDT)
Message-ID: <a5faf969-1032-4814-b9ee-c851d28961a2@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 16:06:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add support for ice sdhc on shikra
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3UX0T6KcFzZievrpbakYuEgt6_nBN6MB
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a269b50 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GO_outlitdoLqHpc7vUA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3UX0T6KcFzZievrpbakYuEgt6_nBN6MB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfXxQLd2z6MrSr4
 4DF1JhMuGETsAAVfmNzDvRqNNXI/dv6ACk8DAC5BaBwNU+e5ytesXA9FsCJtDOWyIMBA4juoNkx
 FV/0bkwbOEgsX2e02+kL7JcFYRtF+a18deqtpFlmWqQuEObWwhHy8g+nXyjiG46DhEYj+aJZoqV
 QPdLS6gbekoKmUnfsfyVf9pDgoz3umiOdquSFfexajiyWiRZSJMv5ycQfcmfAPjls0pKbRwuEUc
 dDqmUA5xeGTZVBN1y9lWLNknqZJMmr+PZidXmer/wbCLSHfVrCqy6+54VUbx0ROjei4paGSr1lZ
 RzZZUYs4QvV9AMa9QhmioRsVsBEuMzjaZ5ryUbA/aK77+fjbebc01fm3gQU0Z9JrWoDOSwnDuKF
 G7MvdvtR2enQp/oMfcatHdug8PG4+kv0wbJzA++SuC1EndWA8MVXCt01Q92r42Bx0x7H6Ok4egg
 xH/lYwmcP6oW/X59OFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111833-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46D666554BE

On 15-05-2026 16:16, Kuldeep Singh wrote:
> This patchseries attempt to enable ice sdhc on shikra similar to other
> platforms.
> 
> Validations: 
> - Driver probe on bootup.
> 
> Dependency on:
> - https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
> - https://lore.kernel.org/linux-arm-msm/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Kind reminder, rng/ice/qcrypto patchsets are sent together sometime back
in single series and please follow here[1] for discussions.

Please consider this series as inactive from merger point of view.

[1]
https://lore.kernel.org/all/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

-- 
Regards
Kuldeep


