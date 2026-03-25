Return-Path: <linux-arm-msm+bounces-99825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K9SDmW9w2kRtwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:48:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D21323425
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7F13023506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C203B9DBA;
	Wed, 25 Mar 2026 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1TqGJDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFKQvwei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9255A3B8937
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435185; cv=none; b=AKXtIDSwEdIl3FHo02lkgn1M37eM37ZHPJLxbi3JaaoU0R6ct79Df8RJdS1qjth48yRjGpAE4GXAZfMg25RFU1UWzDqfORNvNAASi9m47Cb9NHbtOGuoMdU/mAggLe4w0xKl5bJXVCnW3ER24cHUQhdb6DAdfQGVQ2WaSFgBOJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435185; c=relaxed/simple;
	bh=HHgwGV5wzWeBgJq5Ox21ZftHY4R0wUkhdFxYlD7j5qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVUOACHlQTR1qPKpGwQuOfYsWrcsgbLH3JqZ2qc9Q/2ogCwKUfQ9TO+XFl6q7AmcRqLVYrdzXMg7aNGDRhCHRFdEHYrocA9ZwVT40hhMy2K765EnGMQc6qiLtghjvfeitN6dSfrlxp9HNzqvKVxIPETWtloA4AkdhPu6TGFQvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1TqGJDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFKQvwei; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PARsn3658612
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CgdJZ/1AncXD10N0VhV263/E
	ba9KRfQGDrqqpEEpQLc=; b=U1TqGJDMlszlY1OZkbpxFqYDz1/XY4xuf9p3PIsO
	MIHrZZud5MzYBMQevFX8dh5AvaXE4BQB7Bp3KKnlMzv5y7s9nhOai98pNWPgBjuF
	Mv5Lh1MWOmhWdEDj60X49bi9w0NPbufmd1YqOUrW55KpHVaNnVkydXuB/hLi4Fn1
	JBsj80KMZkgksYlKcnPAscw7WqHFLwej5TCVbGMMMdPkRnjGBHM+siQpcM1oqgqr
	LGg9U+6xmyicRaVyVcKX8AVsA9XPtc1K3Y34f6C0fO1azMHD2JqqEqvLgUc+Bbfq
	Ar0AGScnVx5QkgTgOQ3blTYMbqFibB9G7suk7wG8zNyjPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whb6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:39:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so29020751cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774435183; x=1775039983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CgdJZ/1AncXD10N0VhV263/Eba9KRfQGDrqqpEEpQLc=;
        b=TFKQvweiiDcNYggYYIigR5tNRDFmAWssA+Ftidfrf6T5Zv+i/i7QsV1/BURO1xZMP4
         zHcYsslWwtF934pgF8OvI93ytbPXck4UxIQNfmVtjSNKZna++rExi3Q7BzY7JFebYCRK
         XO43eYKtPQ7IRfsqjywx0L0XIl9kH98ydu4wrij/kSGMUmdwQDl/9cc1hToemRxJV0lO
         6Vfv3N1NRW0cEkzFVSjEkK1psM/F19hM6NNevWLUWYzKnix/L4JqXiWsCXsGVk68OZ3a
         7HUBwGJUHrC8bucjH4XT9fWbnJxzN3D9HGCadaXwgNtlWiNRcAgc0GTIFm2+OMQHUMt5
         UzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435183; x=1775039983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgdJZ/1AncXD10N0VhV263/Eba9KRfQGDrqqpEEpQLc=;
        b=WQhk/eE6nglKJKnwpKQFlTXrd7Q/6ic4mvKAGlbvebi81AVFuCtqCZDZAlfU1x10st
         mZrZPA8YvVAFMnLbMJSvCvH+bukgSaEMPOfu82c3FVDfcZCzYBsuPQ2eoJIlgDnnQ8gX
         +k9+7OjTdtxD78Anulh5+Pb6Fpj9G+EIcfahZtqP75qcgeH95TBhAWyHkz/Frgb0I2pZ
         5+YHpwYtail6L4G7O3bwtGVZWhU6hNRBc4yKOq1e8SSTCLDvcpgUALq1cpl97gDWzDQ0
         sN5jbCs3hpffhNQkLb6sIis2PRsTirvqf+1XPL6tSgRt64DSFtnBjM9j8DJONKexlNcQ
         kfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP42A8MmiuwYb5VSdm2q+VT3oLSUVNZR7VMcTv7CvZgkJwZdDB1DY/7AbhFVZPaVWwkyECrhbggufr945i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxql4OU9tb7D2nhu0r0KwRkZzXLMutkdhb0vKhSej7SG+JUddUh
	RhK2leMNWTMqNGxEGnJp7+fyfOtIn0qMOkC2cmnpWoZuoiRbeV8sUHXGWZ2RArZ+Ngd5L4RLGLC
	MsDD0MrH/EYjnW8evWK5ERrqZzorVPd/c0an7M75w67g18L1o7hwpHM5HzyhM1cuojlY1xcVWV8
	Dg
X-Gm-Gg: ATEYQzzCBrjH++7TZLnOTKb0hpOmjn0X7yw5N36+9o3ncfCBYnU1DoKzJt3vhH/atYP
	xO/gYKHrB0smpjsGokA7HE6nFJeqPrZQMnXTVnhmNDviisqbjOeOB+scCLqIvzCaSmrp9aAh45f
	DOUMsp2puY4l3SOho0QzfcaGSD+PR5Q0ovJP9r9BIQ+c7pZ1jc0AVtewPFbq/SDuZYgFZCALeGo
	9/l81RCCfKqbXztA65WXo+Sk9DWcgqdW0GFCWkqvXJquDlM9976gHiJmOX0R+AUVhqJKxpVhEkA
	0hUqVYD8+SKdQporQbeb1gjP7Vr01f7AgVQCfkqIMWGK8Ic6bDwS5BdC8HPldtsvWntpna9VWAq
	vxY78moSct1JjT/L2omcY9F2HdcXsq99j09u3+mR8t3UmYZ4SrlgN9CLzV9IQPI07BqTFZFZjsE
	yHui385FPsFD+tRq3UB/GFOBmiYRkBFx2q9LA=
X-Received: by 2002:a05:622a:11d2:b0:50b:3443:e216 with SMTP id d75a77b69052e-50b80e8ce90mr40449081cf.66.1774435182530;
        Wed, 25 Mar 2026 03:39:42 -0700 (PDT)
X-Received: by 2002:a05:622a:11d2:b0:50b:3443:e216 with SMTP id d75a77b69052e-50b80e8ce90mr40448821cf.66.1774435182071;
        Wed, 25 Mar 2026 03:39:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm36779971fa.32.2026.03.25.03.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:39:40 -0700 (PDT)
Date: Wed, 25 Mar 2026 12:39:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: drop apq8084 support
Message-ID: <tv5jkfbfpz4bmabrec3dtotx2hxueaexvgqjnwvyheundy5jui@mgsbwckmpb6t>
References: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
 <fe12ccfa-d201-4740-a317-e07353a96b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe12ccfa-d201-4740-a317-e07353a96b1c@oss.qualcomm.com>
X-Proofpoint-GUID: KplmLKPRhnwrjwkRSsJPurhqmh70aGCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NSBTYWx0ZWRfX6vmXbW3bGaC9
 r+hWw6kZ4WW7CMMYuZ/19hd/kFec0BcbvzXlkXWg6p7zj4VjPY3NllgHD4gljM1G+hGYmtLLN5f
 vC7wqnfNQAIpoN0GhS+D67Hy906wHKRghdrxQzmUj6pH3YRvc/HUY2yORznscxC5/LpUfJ+f/f6
 iSMdglt06DLOjx6CSdeVES5lPKmcNfVzEqOfxmaZlGWK1E+IXMFQ8tBbkTn2GpJbNd5YDCsdDc0
 lZB9iU9uKLO1dwhsAIACGx0E4IItudHQehGBOMBud2KVOo/YG8TfWQNaCCD8dsIwd8DRnVZB733
 gUDtmm7+Kry/iTrNbKHz3UwtJz1lKIeFn5b6FTTkcePEz3qiV9cWA56VWo4+RDaIMHm+1j4JCv+
 ixi5me/jxczivmClryP6cJTfHOxsreFYg+OlKINmQyCquVC94TN4IvRbc++TCzIHM9BWOKEKWQi
 eCbxkuU2kiDbUIYwChA==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3bb6f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=0lshrEPJcMAk2WublLgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: KplmLKPRhnwrjwkRSsJPurhqmh70aGCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250075
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99825-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94D21323425
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 11:09:24AM +0100, Konrad Dybcio wrote:
> On 3/25/26 2:45 AM, Dmitry Baryshkov wrote:
> > APQ8084 is one of the platforms which gained very little interest
> > upstream. It doesn't look like the there was any interest in these
> > devices since December 2019. Two devices supported upstream have very
> > minumal DT files. Start forgetting about the platform by
> > removing DT files.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > ... and start dropping APQ8084-related drivers in +1 or +2 releases, if
> > nobody objects.
> > ---
> 
> +Some pmOS folks - if there's any community interest, please encourage
> them to contribute sooner rather than later..
> 
> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_805_(APQ8084)
> 
> doesn't give much hope though
> 
> 
> Too bad - this was a really technically interesting platform, loaded
> with all the features you could dream of in 2013!

If I see an IFC6540, I'll buy you one ;-)

-- 
With best wishes
Dmitry

