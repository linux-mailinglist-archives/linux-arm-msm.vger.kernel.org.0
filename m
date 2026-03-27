Return-Path: <linux-arm-msm+bounces-100509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBk4J0kVx2mWSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:39:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0851934C656
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 784C330892C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBB5392C34;
	Fri, 27 Mar 2026 23:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dltQ9cF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwokLV6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811A390CBA
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654515; cv=none; b=nGik12ueHYDpzVagmjf4zxds3aoEmhfTCAMzAFL3ewj11ScibhydbaREGmu5fDhDRqmiRBqZmMyuQ2zLQsYOECy9LfrGsEUZuj+/T1vG8os3MqjWN3+lLY0kqOTjZL2lY0rg9q/4NL68rskN8Y7QS3NNy8J33Hyj8mDIgB/J0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654515; c=relaxed/simple;
	bh=z748r3JzrVNcsOu1XXk4TCfZv2PoDzts40hEbJPK77w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThDiQcLRE5CmA+76CWa3pHhh4BlqhCW4csAhqYT+F5sIZHD2jopULK0jPs7NshF7Ikh/gGt1gRfnupWLBsgyl84ApclhbGyvBemm1jIkkxg/RPnkDLrLk2fQrVAmBH26lTvVNjtSzWivaDJK90KSE2hDemxa5epTxzAS7N8HoAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dltQ9cF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwokLV6K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN42bI772923
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rPftMcpJoQUSQ0b3mJGGeLW4
	TGnDrlPt2VGx8vuxkiM=; b=dltQ9cF6pdZ0qRad70nVujx1gR6I1sdRqPtUOuBZ
	7g3/nbK3/OSRuAhcHV1EBwm2t9/HzMLY4Nb5h1MpiiXN+YxCQJ5Khc9WK5woh4iB
	edWwmAeW5447VXkX/vSGUVgGtdMLK3LpdeodzV4C7/21s/YrEMECaO5gOYjBY6Cy
	zT+6jhOTQmvsWjM7bQNOuGcY+urXyNK/oZDe+GFljo5l3o6BrJ6uLAWWdAf6wxqU
	HrFCNHOBZDYhSDaiszJlUPplTSCvavGQC4t9At82LamQWizIWK3yrplHIkciUqGN
	pwSh/wkPONEdDIM0+Z5QAhQtX/UwYGPUGlftXXA3NOoReg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhj00d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:35:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso73469571cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654513; x=1775259313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPftMcpJoQUSQ0b3mJGGeLW4TGnDrlPt2VGx8vuxkiM=;
        b=VwokLV6KFhwiyyWSmGMF0eH8q27390GHeUDVKlbtFt+tluTPQtVZoO2HKlDOYQYqBV
         u2cw6PBpxxCw6XD2wdgV/1Ruq4vbmd6uBc3kc9BOjGIwzhMGd7i/RrfYdqybumVRfGFc
         rHY4oJrBXy1TcTXdyNcXuYbHGwgT2HTJqgfeZ5bRwwtJrRgG4Kl0WKYXkqxR9YLYpFAz
         sqHlj1YkDpweBdes79Y6vcHMjOlzW0Urk1uCSXCmEAWiu+VIU6bishMmqE5EUlq8bhk6
         3WzgUbdqotBV0yPFJatEdT7ikhSwLENlv78LPJP+q73GRIOk+LNPxErRE3FiIQR16sZn
         k+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654513; x=1775259313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPftMcpJoQUSQ0b3mJGGeLW4TGnDrlPt2VGx8vuxkiM=;
        b=XmEFTSt0DTyA73feaVyjoo88/a/Mj9JzC8lScMcgLp2olmDV74GjpehIhzk2JgnBEE
         hIw8ZAnFkk8ec8lnp3F4Nc7teX4Se9EoU72j1lsUaWD8BG3HNdT/WwrykBwb+sVMOh5t
         hp1SHYhFwhYTysZ49FdkGyLZKUeLOcZw7pCGmVbP1Qo/+cuBTKwv3wu/KgoH5VxT/iEa
         qXv0GypIVqx126Uj40hOcmCu+A948zj9k/KBxehtidZz01wIlBitdK7l/r7IKNXH3gcz
         80g55rNhs3gMVPkorKaVmm2X24AdkbWSYvKRJ8aUa7APW4aqp6asTEdRhUJsl1+ZJj0H
         TAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt0od1wMD0gMl/fzrhFc8BBvlkmtvVYfgLH2NbIn6TKXCihBU6CfTjdpOVrfW7jNwNAZzD4FvTLXfcJjmz@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMyswRRogdCMLJd3256rPF1/3hnDy6DzAVty+9tf2O1Xrf/mZ
	4x+8nQiuLI6owSJ4Fc5yWsvMGXcDWN7w7q11oYcOMoNSRQ/sZSBEd23YUb8NeCWSR/4YNUVbM9N
	PQZxLlQgxc04t/x1GaIbekUTVyt592y4eCzPb7nzpHatC3x4O65Pr+x95Exn/5xEhK0DP
X-Gm-Gg: ATEYQzzgnTL0QAWHImF+9m8ghNkNmbEA40FveUS5HWP/5qPKxMxyRzYds0nQyNBs//Q
	lnSX2+SnEpQSdGDN6cnxoL6giULuiivGWzsXq+qehSclx4qYOJUweMC5y616EpTuz/eMQAfoj9/
	4m2ze12oxxOPe/EeXHG3LOyrijmq+sptRCjG6nUk7vFdmQE2rDCYsFtyjMPcTPbMxphr4CorWjB
	OT/Bz8ueGGAtFsTqElR7aaMLQVHaVlQxERz5DVbiwiiVLQSRcBf/poE/anN08dka57BQuxezvYB
	hGQvxAQq4nxjZpSwVXeJ4Io6PumSKeMcmKkGUKZfc+ubmfSk+MVjaZSAaxkFRKV0vM7gRdy/Gqx
	XzL1mzv0F1/ECqxtOeERStBvE9owfywGMvEORpFV+45VFh+xSIunGc3wc+dy+Xsx/3+QB7/xeXr
	kERf4A5olhRgjaLZbQ+Pa76xO/w6DzXpvS9m0=
X-Received: by 2002:ac8:5d09:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50ba3976235mr57551761cf.51.1774654512912;
        Fri, 27 Mar 2026 16:35:12 -0700 (PDT)
X-Received: by 2002:ac8:5d09:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50ba3976235mr57551511cf.51.1774654512401;
        Fri, 27 Mar 2026 16:35:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b14603d0sm82344e87.83.2026.03.27.16.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:35:10 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:35:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: sdm845-google: Describe
 Wi-Fi/BT properly
Message-ID: <rpldxnt4ath3qmo4fch656gwn6unb26h2ptg3quckezkedsvo6@mtmmqnnxi2nv>
References: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
 <20260327-wcn3990-pwrctl-sdm845-v1-1-3f5c34e3fdd0@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-wcn3990-pwrctl-sdm845-v1-1-3f5c34e3fdd0@ixit.cz>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c71431 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Cb6hrz4NNR8bXqT0X9gA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4odqlNwU3IcYP2qb5ecIwP642pqIFYkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfXyet3c47tPaBY
 SjU5Y9nA7ljhypyGESEmCvTEgNir9RPpNUJeL0hg3x4qaBWF/WHPo3W6DysvVt9X8edngldB86h
 egs8u7N+mtrYYsOb0SbExdEzbBss0H2EK/2Hat6I5LJuropKzQ0Arg62iha4TWQlt1Tpc/cZdFF
 KekN2GKsktSniQBzmbSaicArS50xG2o6yO3RFm+vqkiCt0d74JYWCZZSNPLUf1AWp9C3GqW82U4
 9YKhDhYDGZ30Z9RRxxQM+H5NYOHTkPv8EQ4hGG7PpTfne6GmcEnptV/D1FHQ0di4CwqdHyTXnOF
 tuBSYVA+gQ0Ua8zrb3ZU1ACRsKXTmMgNQFngy4vYMiS3ei3a7PU8QGmZ5aODiEqgZVSjt12yoEl
 1j2ukR743qUDHtXHUMPQcCEqbYX/r6R8Ixn5wWCPBLiZa9nSw4W+2Mny1TwMAIusyJNTMsevMv7
 /qnWNZDIV5mTjAXbGAA==
X-Proofpoint-GUID: 4odqlNwU3IcYP2qb5ecIwP642pqIFYkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100509-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0851934C656
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 02:07:08PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard Wi-Fi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree
> and rewire Bluetooth and Wi-Fi supply properties to use the PMU LDO
> outputs instead of referencing the SoC regulators directly.
> 
> Couldn't verify the swctrl GPIO thus omitted.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 42 ++++++++++++++++++----
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

