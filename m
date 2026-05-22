Return-Path: <linux-arm-msm+bounces-109307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC23MPVMEGq5VwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:32:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 065755B402F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2F223037DD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4829C370AFA;
	Fri, 22 May 2026 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIfACR0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ/hUbqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F17367B64
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451876; cv=none; b=rONTQ3NbculJ7b60nFvBqP+nlMcfbxhJy+Kqr7F8nGoxuW+ZZMzVGIjINABE6v8Not3GM1VBrmZlljQzHGi5l1YfrxLQAtzzix2ZobH+i3efuPhAQFzGZAMbDz1kO1MObRQ5VQzJwzzMw1j0OveB+W0Am6ZVYEQsUIZj+2CslAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451876; c=relaxed/simple;
	bh=dgICMZZouacgWo/0FnvpbjBB2Oow4yk6QUlpKIKFJKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFYwByUVCY5V2AKm6R5TN8jMUN7ya84bR99/vyI1mwebVwUsl4+CHQzoMoD6EfbVLpsV+3dzH6PZ19B/SckoiIUusJlCDLWy43m3i3xPo3jvt69UokCTL/KqGPv3sbM/Cd3KG2VMzBddQpMMSqIz93BIjydNxwXRmeS4v7DBCZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIfACR0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ/hUbqN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBZUa91297958
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDpdwUQzuuhK5MqHY291He1R+WgUjp20dwFlqgkIrBI=; b=BIfACR0WuyItvzrU
	lT/rH7e6w4pOMOXTf2plcOXx2+sDr8HQQiQAexT6NiqH3vhSlRvCx6ffEH4xjw1R
	LC+LC55bAuhbqDke4k9RA7KBC9kCBNLcHeriPabyNcz2X2lrtuh+arNWycXuJ7ew
	v9wMC0948oSiRIJSi1fSJh92oNBfkxnJT1kLkXqNr0RqFC1UmgXGBclBwFmf+nHs
	yLoi7sturUX92+f/xlCqkAFov6NQZ18YrvQNdIBJT8F+2RwSG4ye03EVsH1WdLEV
	i1c3nIvcjdudPsnbdO0hfOTQ9BMqqaWKiEKKfaUBxFJDTSWprukJ5MkwKOG/AYXE
	Tdp/sw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0auxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:11:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751831fe6dso445560e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451873; x=1780056673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDpdwUQzuuhK5MqHY291He1R+WgUjp20dwFlqgkIrBI=;
        b=ZJ/hUbqNsRUfZI1GLgDtSCJPeIDU2R2DNE+d2nw6Ob01KkwrAmLK/OIGvBgwG/cK2A
         wI1+LCg4nSBuXJdoL1sMzu6AAllYomN6R3rQVkVT4r6PKKLEtZVUaAd/spNR9y8zwTy9
         wFod6UpzpvDLr3E3QFSHf/1mk1+R+rzlXy3y9KhcByYp89BAx+pw6S/V7giub7l5QcnP
         UGiQB59CuvQ6PG0oCjXXOKkmeRUtl9S8WhzkI0tm+3m+G0jjliK8P8+r3DRCqWxSJR6E
         Gfb2E2LUuS5r/YfWF9kD68xCm1FUt5XTjdaRQ/xf2kmufCU2SGMU0J5eWeXQd2zNxvL0
         ox9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451873; x=1780056673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDpdwUQzuuhK5MqHY291He1R+WgUjp20dwFlqgkIrBI=;
        b=kZXB0CHq7XFQBXw4xexs6K2ufAFUzy4C2Mx/E2/AIN07BTW6J+o/XOutt1YzCGdfAg
         e6Rm2dZIS+IkMCks+plV4CoBr5+8EJvh/0tJ9df533VSL4T770SiCtf/mQ8cie8BKdDw
         7IlhIiR0yRVv7jFnEu3Oz9ORZJw42cO6D12/v7HEZDJAEDV/2c1qilcAktzlYsfLvbW5
         NnK7ZIa+pEQRUj0iNxpmMFcBtdvHO9VbbBOBMw0rLPF4FS6pd42nanjcS71pZiW0kpOW
         YyVTZTejgoK2CIqUpqFXKgPxoOxFwJ4aAuZVi1KB3wuNczoWHYVUP02INWqRwkIMGynj
         iTrg==
X-Gm-Message-State: AOJu0Yx+C+U5vtEa6seDr7YMApYNseafJ4n+HC3iXDWOjkdZq4/c7iGv
	nFOFnkKMOF2nwQiv8CnOKh5EQ39ZZUwarRN0NGLvgw15HIxjpZPcbvFFzNInilj5MHULKoXR3jm
	gP6atNYTM0QLFP1bBejs/dOpJnJ81+kbsukCQzunG+5mEXcoCl0GAwbOMwFvPe6qCdtkI
X-Gm-Gg: Acq92OFtC3JoJf3lKOa2OA/4spIkRfN7YtGcEPZAiqpBnkU3Y3LyRzsY2UvzcPNV7wJ
	c7PIspiP3dajpLQd1ROCX9LdZT12aKiB7UsUUdBLBtmVobh+b6eV1CD7qO/tcq6qMt94myCbpu8
	kw7L5cnTyhEsxJvtNOprjTFbIlk6u0pf1Z3tAP0UIIzB0CBoS9qQLVD+0AbcS6PVnn8GsITkL4L
	Ixh7UJ9AgoUTBRFBOOGk1naL1RVghb9/cp7+gGpwgIxFDEaguodDPUBkCaXFKlXVYlce1ROqhTl
	ahKqMBQ+FrUzKGI7I0OhnUclYTJbVM+NzwdJmQ2E1ENxfe4TDkq156E138WfqEPYQMwXx6B1z9P
	E9/tYmYquUGykh3HK5qdr4hluF2rHEB7Un6q6Vlg91ckKVZzyiYpxBkeq
X-Received: by 2002:a05:6102:17d4:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-67c82ff508fmr407880137.6.1779451873500;
        Fri, 22 May 2026 05:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:17d4:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-67c82ff508fmr407871137.6.1779451873168;
        Fri, 22 May 2026 05:11:13 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm605052a12.0.2026.05.22.05.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:11:12 -0700 (PDT)
Message-ID: <c6ae47fb-b7f2-47bd-9e63-80e6d66310a8@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:11:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMSBTYWx0ZWRfXx7d3EZPXjQgi
 n9upDpv7Rf0a2wi3y1IpVlkeqo+wy/LscWxEkYo/pUNMsCT9yn35IbHptNXXSsu9wmM4WYX2O8P
 4VLP3huZSI6xgrxAx25rd5jPUQ0BA+Nl9TdOdgHNax1fgxVjIuEG68JcqMqtS8kdrH9r1upEvfK
 1M6y3JHaoa7iARSHXR3L5VjxokVCRTCoh4VAskVYBNOiOSJ0fGv/wk5lzrCHinpKPDHXo8ICjGa
 XREMiiB3qhyc0l+0VZHJio+Wg/IVQTUCbBm1D0M9HeGEu4sNNIznmrOBEVAUcAotZ0UM0gHtE/H
 Yh6u1SWfisyVmrp7QGwXWoKwhsUu6yjb6dNT5if55uMgQHK7n6Rie31i18bedRlnNfneApO3CoD
 /FUszcZiDwCQKmkK3mgC6nI6WBbphJrjb8sRF/12+WGA/vRMzAiYLT49f327idoCstqNYAiAv+a
 o0qjv7UoSV65Q6ajZyg==
X-Proofpoint-GUID: D2bMYpV2_L3XRfFxxCQzCb_Votg2Vuj-
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a1047e2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=l6izLxsmSAxkASaVBewA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: D2bMYpV2_L3XRfFxxCQzCb_Votg2Vuj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109307-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 065755B402F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 6:09 PM, Abel Vesa wrote:
> The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
> an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
> while the EVK base board provides connectors for a multitude of
> peripherals.
> 
> Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
> Describe the regulators and board clocks, enable eMMC support through
> SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

