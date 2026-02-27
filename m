Return-Path: <linux-arm-msm+bounces-94522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPxPF4/2oWkwxgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:54:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D41BD22A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C01FE30E8A32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62CA46AEE9;
	Fri, 27 Feb 2026 19:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQpUZ1u6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdBAM0/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7223AEF51
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221979; cv=none; b=P6bNUd4fnMIFawz/0OYtHO4StclpQ+xCis52hQOVephHqgiUmgZ7GGKnYhcyb+UdmfsMVT/zpplktfl2hU2Ko1GEhLInTLR93HRVp0DmoP+bVNwPM9tBwGTL9WbswlUVedypBOz0g0eYBpAftJKB43kDYUktNcED3aTTl/diosM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221979; c=relaxed/simple;
	bh=xQ04bpy5cT/HPxv8GhdIAXyz6uWldP+TKSsvStO1lsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlJ4z6stk0LPwQbGQo2LBxPZhavdeZUnlcramADJiBTcVpuQdVWUV6PJtBGLqFIY7xPTXUOtWoyQMYkphFGY2NBKPlJ4T7Q9yX474Bqdne+Q7+VFoHg/pm3GRVYeZCii7Srq2QHMbZIrxE3Lmukvpqs8ssNMGgpSPVb9LnsH4lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQpUZ1u6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdBAM0/j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RIetWP373605
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GV2vdzc/TRaF4f8dfG4rJXZ2
	LFeRYlnAduxU+Ay8fN4=; b=DQpUZ1u6OkALzwe1XRol5kLad0bXNl8C3geIxs6O
	wHtIS5+mvtmDkIpnYSs5MM5NVFhzRqA4JbQq+mEsORuGb5/JtLx2Vz7vRHZCNg4+
	4gYzvWTICbkau3egFf7Nj2S6X/l3aeXc39zN/GBXgPVXNfsPtiq3K/eRHsEZ1sFy
	Xcq2nmr4NLvH/o9QbA8eMPHjbQVNkoBbMET4JxE0YGqyppBdG0as3mdUsCol3OvU
	SyC2ZRcd+wpiUy4ksVWeDvD+ziP83QOLaDKx1sLKmP18HACo2EK1AhJFmcQQsr1g
	Jztt0JvZ7GSJ9dcjuB/2ICRxLyqUDyBCro6uk0d1x15waQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckgrtr774-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:52:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ff05c73so1854503485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772221976; x=1772826776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GV2vdzc/TRaF4f8dfG4rJXZ2LFeRYlnAduxU+Ay8fN4=;
        b=NdBAM0/jn6vJm91KRCp7IfoDo1QF5u00irMtGcKGUeLISj0Tqyt+vpdz73lSeMu9v9
         an1lPE+OBQku76C7HnIW1qTK6Xc1RuhYro8iOwXAvbAUV0WVX3rSNm+EmcFAC5Fl2Dtw
         EsdSE5lpRFr2xKwD01JwLKfrwq55/US52DYBmlyYIv0twETH5VdlBuLw3DqHwHQlkUaJ
         gkiMJVg5MO5SO9VivmnZtoZMU7kPen3X1OYXsEoFwXJyB/JeREGcTHxEwSJgrJh767SO
         /jYqY2zL4kC6wcmqqSPR7xd5NSIXS0Zvk7HKwvP3SfDZVi2nV1JxpyAUWumbcOj2+T/t
         SK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221976; x=1772826776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV2vdzc/TRaF4f8dfG4rJXZ2LFeRYlnAduxU+Ay8fN4=;
        b=t7K5jqFHuBVMKUwK4/TOwKzhuV7RUzy2lvg0pjWRQd9IzHMhINWas6wRlZ6sCQ4Cy1
         2W6cEEChhq5PSPTVYv+m6Wf4VEU3qaQgmv5jqhszIYCc0DEyTBBGwbXl2oIx+VfdRkfu
         Iqbm0mbSyAWnOf/MFW26Mj37bnchxBM/OJxij5EHjoq8LbREl899Fo8XmgVSIh/9462A
         sQnhgz1v4fGkz5oEdgEyiqLl/Hj4XKhz7HbJGN/CiHF7wK1nWoMM3soBsArw7XpTqoyh
         KgknnKzTcVjcic4Ah7vvA0PKsPASVdzgvYx01UOSxrux29vty2FMu/k2nPkYt8WZCcHX
         SXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYdT+eJIRDjhCSITS+5OkDJnerk2WYIDIlUnqRaEd3zqXaPUapoKXtSA6WPJNhpryDINFrbmzqFHX+ne0u@vger.kernel.org
X-Gm-Message-State: AOJu0YyULw461Ckr28tqponI5CKFwsr8F374p3rZUp9EBRiAS9EFzrHL
	CZwKjbubxqpQMjHnO0MrPbrvi5avZWn9VWTTtd88wy6tl1sL9P5CjGjecmvxciDfGr4kWH+7HOj
	gE9pPQiIPvAee303pM4z/y4pGoe72vKBnBT1LE2dEm02IEPn6dnESErkhRJS6wU6arwbs
X-Gm-Gg: ATEYQzwEtj95D239/ToXG4nUaUw5rSJgXoPyUakSaSnfNcueM2h3UwSLmkgrOpWs/VO
	+CozrXVsO0P60dZOen5zJ6Fk3DdPg2t5diOL14QrErfBF6KwojJBQKm+Iy4KRnv2TlQHN8h7B6d
	XxaJO27RgQX5FhepcaPCGxyKEt7JZaTu8wyxeGztqIZqaGKfBf87NJsAZ0D6ODeffkU25uxIDGQ
	mG+oNoaOg34lwHSGjC74YBE+YkrrExb6mGfOpTpz1RhiXEzGYPo2Lg/xIzDUZqrMzgSNrZwZHdW
	m8Jza7GlvuWDuvzwKZPNPuRaGoHmMDrHHq3ubzSJ4UOByjUh2Ytb9Nv/rZOpqsk5GC8sJkGhQlG
	lQwSzBqIjTKbhn3C8iUC0Pk4zySzMfVl2omCW5jtkSmUT3yUUCKFdgD2zuqY0jcLMCwnMaXbCxb
	IMA37A4lmZrAkfmR0wAKL27/S6/5BTpC0rJGM=
X-Received: by 2002:a05:620a:7087:b0:8c6:d343:79a4 with SMTP id af79cd13be357-8cbc8ef670amr482959785a.40.1772221976094;
        Fri, 27 Feb 2026 11:52:56 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:8c6:d343:79a4 with SMTP id af79cd13be357-8cbc8ef670amr482956385a.40.1772221975562;
        Fri, 27 Feb 2026 11:52:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b2b8sm15082771fa.8.2026.02.27.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:52:54 -0800 (PST)
Date: Fri, 27 Feb 2026 21:52:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C8jkCAP+ c=1 sm=1 tr=0 ts=69a1f619 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=c5cdqb5w248ZMfMtUIkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qEKpcfg8QD0v8yJaT_0ZiKSgYdqPHrp5
X-Proofpoint-ORIG-GUID: qEKpcfg8QD0v8yJaT_0ZiKSgYdqPHrp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NCBTYWx0ZWRfX8zbM1wqlqXH4
 mF1i03Q0gDp03XBPX+kzx69kU2YVpVr5SzmUq1Iw/e/LSABXwYtDJwKHFHq3Z03rsZzyhL0VC7+
 XYDK3CriY8QnDQCWSFQvOeNCpp+Duaf4crwCGrNFE+4SV59of4sBU654Cp6Qu2NjcH+pFhCS++F
 //I6HW6//X6o1OL3RhMEYXAnYdOk66mDJHNJTLQBz5D0bI0X556/sQlNvZZWjSp8asCdM4/SmFp
 4OxRk12VFZdXbWC1qWCP4sPC7c5mKoqSZA46FvxWk9nZtP6LqGJyyCtj0GPfG/8llE83xHkG1x9
 OIZLz6QFswft3+TF0XXau2FxfKpew7C9zN5bnbe+dQOsaZVyBkllvyvyN1CiGlr6URaNDOehSbM
 Z8BZlvHVRVekS53T4mU0x4pBAJPAq9yOjS3IXeUq5cE75DW49JILPnk0Fttx/34oZO428jSPyE4
 NEHkD3kPuY38CKDUUfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94522-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB8D41BD22A
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> iommu-map include all the different stream-ids which can be possibly
> generated by vpu4 hardware as below,
> bitstream stream from vcodec
> non-pixel stream from vcodec
> non-pixel stream from tensilica
> pixel stream from vcodec
> secure bitstream stream from vcodec
> secure non-pixel stream from vcodec
> secure non-pixel stream from tensilica
> secure pixel stream from vcodec
> firmware stream from tensilica (might be handled by the TZ / hyp)
> 
> This patch is depend on the below dt-schema patch.
> Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
>  include/dt-bindings/media/qcom,iris.h              |  18 ++
>  2 files changed, 279 insertions(+)
> 
> +
> +  iommu-map:
> +    description: |
> +        - bitstream stream from vcodec
> +        - non-pixel stream from vcodec
> +        - non-pixel stream from tensilica
> +        - pixel stream from vcodec
> +        - secure bitstream stream from vcodec
> +        - secure non-pixel stream from vcodec
> +        - secure non-pixel stream from tensilica
> +        - secure pixel stream from vcodec
> +        # firmware might be handled by the TZ / hyp
> +        - firmware stream from tensilica

Why are you providing description as a list rather than describing each
item separately? Then you wouldn't need maxItems.

> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      $ref: '#/definitions/iommu-types'
> +      minItems: 5
> +    minItems: 8
> +    maxItems: 9
> +

-- 
With best wishes
Dmitry

