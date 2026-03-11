Return-Path: <linux-arm-msm+bounces-96793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHM1KqTCsGlSmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:17:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BE125A4B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DFB33032CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BB034CDD;
	Wed, 11 Mar 2026 01:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEQ9cFCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d08ZXZKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963FF1A6807
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773191821; cv=none; b=E1UTV5u2293amsZyFm9tcxN7Q6jZLsB/hSq6CFfg8hxhdx4zNx5e5MFRcVKd+05Fz1Asqn0GCgA55aJlxC/m5FiXvB6UmxGo3vjESELzw0Mvu09zjj09n2zLMme9cgSiTkPWpqNWzXPM9c3eQ/rWMOnvNheGyLoe7zidpMJoNrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773191821; c=relaxed/simple;
	bh=Rbg6zbLAB/XefCUL0Uc+MBOYdiq8uLsjDEpbN1K8V3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApFkpnSYwWYPpg0FCgc32QcdoTL2DBM8YcAcPf60Ut2jiJyLZ3sC5f/mNc557nompV/7CuEANs3mjQm4StFUxChK1IBXErXFPsOKNAqh78xEg5Qeqx2RqpYcwtJE+pKkwKzrW5zJtm5tZQxUyJb/0X0QNFPw4g/YYwJiXMYruko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEQ9cFCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d08ZXZKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B0bPWO1266072
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7CvJNk94EzJxq5Cw9FP4YCE
	Diz04Ee4l6aQWsWL9aA=; b=hEQ9cFCcktvaTaRn55PLT3hH2ZeljY1EX0Xq3sGf
	uMa2jeDLkrNL4fNSWTpYNHmAoV+Sp1ThqhK6TqTtu01ksL6Tlf0E1MvzGVMjBQVp
	Jws/iYmuR+HJKJB1ZD6yLeDE5/fmjxotcMm7R1TS0te4ZwfVYsxgUHwwZ1/DlSPP
	itWaTUzqpaGsN0Zb2rsrVSFdNj+3Z1QyShd4f1wD9UETEzRaZV9lqmOnpwelxMLo
	0uNNAnsoBWnRGcviDxtgrsMJpb0AMRha4+uNaq11hfxXY1hOQsszsRhczkMrtlYF
	kBOQUF6frJ+a5GrEhF89HsHiWYn4ldkAlzdkaMNKxaoxKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfhrpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:16:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7f6ac239so1987688185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773191817; x=1773796617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7CvJNk94EzJxq5Cw9FP4YCEDiz04Ee4l6aQWsWL9aA=;
        b=d08ZXZKZyNKuajOoau7lz/ldIV2EkdLjdKKFEIZxpwklsi97C0BPkz1yGEh0SFO12O
         wP0tViJJzT0qLcXk/gv2D4/1AnRWL8TJeRVhddjcsu8//3GMmTd0QC81ZyydY1GYYQK5
         gwlYTvLzUmOnLGtkPswsHpKtIbV3jEaldYqNro+fVTn24+C3rib3GTr2rw2Oc+jGbfIl
         xgvgyPppkLzOQb6/oIJFVrlMg1omfSRjHIlDWfHKQDmF6MvjOrqEefbX+qv1LW2ngsYK
         gcPFRN3OhFeaAYv7jtj/33RPjW2BE0iX+tbVo6ZzN4yoyDXpKodp7bmhbIbdH/d1Q+Gf
         NLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773191817; x=1773796617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7CvJNk94EzJxq5Cw9FP4YCEDiz04Ee4l6aQWsWL9aA=;
        b=jbIMREKePLDKPPo/3Hmev8rDJoMtQnCh1wpLZ/KjHgYftWILT0Ns1qdWofXrvq24pG
         2RoEYm74CRc7SYxNGVeXEE0KB1BIjZjH7xNd+rgFGClvbdUiymi3JXkDxb0/f+vjkFVV
         87XnF0xI1K2fFqltCfu6P8K4Rd2i1xuNPys063S5bUyoUzeTdxNIuXS3v5UCOgkf0Qrp
         MBY1YkBw/H94QNtHe5tAlls1PSXRvYgR4OHZjiZLI/OblR1k+FYtETL6e4BE5PqArPZl
         /Kk7Ds/IjOgWQih/N5gGGtGBVbwDOaVDjlelWpVUuSKi/Xd+K4w9cA93yR1M6kjwSumV
         3HgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoSxpGFpLfZmixaSfPfBda2S6igheUQs4jqUOpqr1S9RUMWY7nbexpVTfkt/BDywsFvYDJGo0FNslji8ZC@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+UCXSqdFPEidS9zwQaWN67coXjHi5WGTPEUrXsuyAgyBO0Ve
	iQH28mduuz68/kFJ8xo6iR5SLZefqP2gaFath5/pMDwiQfxUZiCMpcpZ8HEXVcYdS3W+iLlH2dd
	kpFF8Ixt9agzuPJTkll3S74D2nv2QwD452nQx7BciOt3EMsboa8rF4yBiDz7/ExFo/1jM
X-Gm-Gg: ATEYQzzcp800Jk8bzQHWkwrodWj2owre0X0v+UchF/sNfcS11tz0vBUIaHGpYYp8rt6
	NGRztu9lwNImFZzQwMa41tJaIjeD7FL3BnJ4/59mrLlPVN43PYa7fhWk9VnhF096g/wz+6BLLqZ
	u/2QQ3C9ApXen3uWQTWOHS4HYiMSRkuCocv9MeEOkLzNlOAwGxoyUe1eo1WEjRC/4Aw5rEFvhMA
	Hv38dlR7t7hA9GlbPAaOIn4Zg6yDHy8Xkz1QYsGXcOG6VQm3CHBPYGOQdB556dN9NuEd7Dp91gH
	ZZj1wFGQpmX4jrqUbmzTd6ofJymLWSB0wiZVLdPJp8rNYRfLilKLX17iagA/zOQjUndwZ44DdVd
	/SyfORptEegKWOGzIn5o3rvqA77BD2pH2H6lehx94WWlakVlgkDp20dwZdJFI5aLjLWroGrITYb
	q0pciaHMB6hjg4ojplH/HnEEdS8pJMtUt4YrA=
X-Received: by 2002:a05:620a:1aa4:b0:8cd:81cc:5583 with SMTP id af79cd13be357-8cda1a18554mr117255985a.38.1773191816776;
        Tue, 10 Mar 2026 18:16:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1aa4:b0:8cd:81cc:5583 with SMTP id af79cd13be357-8cda1a18554mr117253785a.38.1773191816310;
        Tue, 10 Mar 2026 18:16:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1560348e5sm131772e87.39.2026.03.10.18.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:16:55 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:16:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sm8550-hdk: add support for the Display Card
 overlay
Message-ID: <bovuc2guy62dddbkqxtyhi2bycuz3m2rviowixp4aww2ssuapv@c3mevmxidl6j>
References: <20260311001238.4191034-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311001238.4191034-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-GUID: ostiG8aoVQ8AI2F2g8m3sAI9SFYySP9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAwOCBTYWx0ZWRfXyCLJ4Wd1qQ7o
 8+Ynv20IjoJoCZnEZDFdLcpkgeHoVbDD+LSBmGVtUfN17VQMeoWdT6TB/d9yCqhUKGawSgbQdkl
 IWFjFziR1Umfl/2esIFo1OExYpI91TnSGN/luaZmk3gRjZKYZwIG/STf7lohJedeLrIP+j/LMwm
 uqXZCp7zjxSFVRKGS4A32dYhd5i0Ov/GxHhAL4WTwpK1cS4NN0zzD33rPylBs/KzChP4zocn5Kj
 xwRlne2EBGA+rjlmtiGs5kxN23iDSYj5djPUjmy4l1f/oM5VgvdR1Lg99qk1i103T+IX0efTP3N
 BFCMAUFtQb1BhiukUAiFK23dCwndbiv8kwtsYWKZ4dUJbs0lp4CZdLrKvtWv7WkcqmNemLEwqW+
 hIGoEUlpKm/bsL2tJZvff3aPE6PRDPuD6HfqnaeLgpBoaC6LNnHGiHdy4msjhS+d48AJgXsXx5z
 Ls6WrjbOvbxKClBm9zg==
X-Proofpoint-ORIG-GUID: ostiG8aoVQ8AI2F2g8m3sAI9SFYySP9T
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b0c289 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=HdtbYBmCxEGgRJ4B5xMA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110008
X-Rspamd-Queue-Id: 52BE125A4B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96793-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 02:12:38AM +0200, Vladimir Zapolskiy wrote:
> The SM8550-HDK board may be connected to a Display Card external PCB,
> which is identical to the already supported SM8650-HDK Display Card,
> it provides a VTDR6130 display with Goodix Berlin Touch controller, see
> also commit bc90f56a1699 ("arm64: dts: sm8650-hdk: add support for the
> Display Card overlay") for additional details.
> 
> Two overlays are added to support SM8550-HDK plus Display Card and
> SM8550-HDK plus Display Card plus Rear Camera Card setups.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../dts/qcom/sm8550-hdk-display-card.dtso     | 132 ++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

