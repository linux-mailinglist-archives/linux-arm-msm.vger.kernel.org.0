Return-Path: <linux-arm-msm+bounces-102154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGbIEXzt1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:41:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5F3ADD70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28845300185E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B053AEF4F;
	Tue,  7 Apr 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmNvdwTM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMh8jYDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2792E3A9628
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562100; cv=none; b=gEqY81LVhJmYAgFsFnteOmFeqrmfHaVj2jWefT9KMBt4CMH02O0z6lOeJSVJwx9b48UKlzXdiCFobNqQU5ersYQCKQZvfrwuyXP2APUrw//bH/7AGAgrEUpDH5N4p4he4MQwnnkq+VG6+IjF4hU5wMrQvw3FU3eS2FiCVoFT5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562100; c=relaxed/simple;
	bh=KfFwVmD/+DRHV1yhUV++VONoQQRwDN/eMXQTswkMROs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqrTAc8ZNdBzUZXQGHE0nZOxwIAq+gAgamcpqMHK65Cja+kGP5+HQmaPK6j7Pea1pD2lheKilcY8PEGWSgOVNMAu7SzfB5vLAOKl6I4eO7puNxybxN6SqoJ/MRYws6ElsbWFppHxXyk4PCQBxrbf27/40Q94YD7GltxvBOox1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmNvdwTM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMh8jYDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376j7DX2009223
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lf+Ywg2srIxXPZ7iig9OairiEFnv9txmyLal9ilQAMM=; b=cmNvdwTMOSIVsA6V
	AxiQ7nYXlwyBNSpRUfWA27tWi3OGOsezsSp6BsQmbSyQF8cyAAM71EaGSWtqXzEf
	7gZmzf8YplIZBV7XDejCHyCHZRsNdQTd6bNnf6n/CUy8DZcojILbfd5AbyW8yRx6
	QnKPZ30lLoym+hOdN+O9GnplYZKq1R4x9KhihnDE7d6h9bMBSQ40crITy56hEcX/
	rfrbQEtzHbOmcsebbvd7aa4mG3KGDEsyZNWMlznDD4l0IPElud7Ln/6VDbHjexHm
	H25neNLhRhbJ98mzabS+Q9iZaiHF25bOBKoN1DuuXzwidQVd7F8GxodM/22hXBEv
	/cDiiA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrthhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:41:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd541c0edso27650776d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775562097; x=1776166897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lf+Ywg2srIxXPZ7iig9OairiEFnv9txmyLal9ilQAMM=;
        b=SMh8jYDESsWx7IVFYJMq4FXrUS5/TgKODghahNFPPe329vsv7dJlnLlSkx1hSykf+I
         yhm878GCqAbx13/hhMh735BcwVj//nfc186pIyS46LefEhLtW2ya5xHJlr5icnqVCtbE
         p97frNhMD2heGLuOD9PpH9UeAYELQFwFY94CU6XnPpNmg7hNft396u72lOAdeDWxcWna
         ZFlEC26XlpiU/E8p9tgBbKDnHuzT4YvxihyHBxAZk2IFDqytB+tHFzTGJ7yY9vOoRCf6
         iG984HcXkpnEg/afabRoFuj/G2mPXS3N+SRvmoo6rJcUpDydt1ovIQHJstW7rRw3EmGL
         lj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775562097; x=1776166897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf+Ywg2srIxXPZ7iig9OairiEFnv9txmyLal9ilQAMM=;
        b=Kg3R8h3iUcVgXhBWs+bybKv8uv2Ly6VUo7tdZZQmhcnMapS/DU1POa1DF6gQUxlgQw
         2A4+Z3au/pKC4eegMUjsc8mMZx53xeWlxuIoj/r3iEPN5lWeC/DpBXRZeiYoLbg6AuBD
         bQEW6KeTcG5D6YMuzR0CFN4fGO/u0DuBQhw4D8NwG7TaDLf/tdPmosbTkZQ/Yu7kbLsY
         yFHKAoM1C2KVtg2Y+mRFAY17534iPaH+D8mTRqYMgkBgaGqeBme1xtBwD1IpIU8YnsKs
         x7suFyNEYCJt20w0fv95bR87O+RVf/ARfCqQ/JYvoSziIJpLqacpx4nyK367sdph7H2c
         Rz7Q==
X-Gm-Message-State: AOJu0YwlMxDEimPLofiEH4r2r1j4FSg207XulRKAN5J2W/p7Onn6TBpR
	J9/Kz5L87/8vMZ6QXW/Wnr/v6vsltMX/aNAX+n1uJwZJCduTWy5k5Tzo7B2GBKAq1IcM8optyvX
	bMGID/vL92lubnhLA2ZTPGqElnFEfhPahl0TMrr0exrbbglSXS5EP7yvAfP4IlllYHF97
X-Gm-Gg: AeBDiesVN9YVmlXZOzlk/HPNKziUjGlMp4k9ThPtRM6T6sNmz3h9HBpYnqM74yUgpmy
	7eOywvdaEUW6r/7kzNo7mCK6jbEuVLhT8TacZrdZUnLIUh0DsJBVty8rPq9dVGZC2eXdhsSox19
	UEMTYK0tPIaL0+P0ap1brVIsQV0TeG0FA1sNd8MphAef9oqO4BcuVLqqpjuJNC/QIwTsGesYuR4
	Z6aCpyMwG/sI2vrOsWKiP6LWktjxIXoksSKMagPJoN2g9/XrOwJq0xcG7WxbC/B63vHqhvKQBUM
	tlqvYqxodO+yKp/uTQFPdqRZCGvKcRxS9yvxy+bMv7SNZGvyJv+PXJ4guiosqMNkG3hU660PHl7
	bjwQJB0WRnlRU7V6ZqpzQjz4WCLMzlYOQ5DgqYHfspNHEOfvl9E/45jEn9871/eAMa0ALxrT/Ey
	qbh48=
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195898096d6.1.1775562097288;
        Tue, 07 Apr 2026 04:41:37 -0700 (PDT)
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195897746d6.1.1775562096834;
        Tue, 07 Apr 2026 04:41:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff17basm549986366b.50.2026.04.07.04.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:41:35 -0700 (PDT)
Message-ID: <238b23bf-a180-4dfc-a896-955b1559bee7@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfX39DWgYHPCeku
 RqbCGk76BMFfAjpqQFTnQ3w0x2nEkUCQ80RKGBkklyGmNSK9DVzmHB2taAigJcPTm/DdR8ONQ7j
 FtHI2qCpZfkD/0kduNra+kqEXBqlR3iSZ6nvaG/pzsv1v5XdYQpBqt4r6dHGab5SfBxSUbCI+v+
 A+dxp+bLekoF8EuvakHtFUHy6ucYY2mYCu84qz8wNhRWNEMbDbgUiywy7vKl1khLbAbeJcorRMO
 sNx/zzMIsVMPgy++vFXp5bp5a8WXllLhSl5rsXMG8IBkVfo5I9p8JDBJwPMIbvzJkLfiDRNIv2k
 ar2ZnfVaqpBh7KLEIAvBk9b9jBqjzVljDWxAEgcTeoKaTkmRzxBCGJP10aVs0K2ENsV5HsOgZMu
 2ex8c69dV0BCTHgCzjVO8mH7lYET4NLcd7szy55038h7oztCkOoY86xKqyPp57oShX87GyqyrrL
 4tbCj8vyMEXNLEcWDig==
X-Proofpoint-GUID: bj3LNw9wUfvDP0rCZV8MbNPeIcQAsakU
X-Proofpoint-ORIG-GUID: bj3LNw9wUfvDP0rCZV8MbNPeIcQAsakU
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4ed71 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5n-PmyvWcR_NXkHpHqYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102154-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42C5F3ADD70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 1:39 PM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

[...]

> +		remoteproc_soccp: remoteproc-soccp@d00000 {

remoteproc-soccp@ ->remoteproc@

> +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> +			reg = <0x0 0x00d00000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "pong";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "cx",
> +					     "mx";
> +
> +			memory-region = <&soccp_mem>,
> +					<&soccpdtb_mem>;
> +
> +			qcom,smem-states = <&soccp_smp2p_out 0>,
> +					   <&soccp_smp2p_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			status = "disabled";

Let's drop this line, no one should desire to run a system without SoCCP

> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_MPROC_SOCCP
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <19>;
> +				label = "soccp";
> +
> +			};

Stray \n above

Konrad

