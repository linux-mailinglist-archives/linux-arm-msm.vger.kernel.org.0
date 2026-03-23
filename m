Return-Path: <linux-arm-msm+bounces-99361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBRECx91wWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:15:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C524F2F9A1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C19EF309FC22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00223C3BE2;
	Mon, 23 Mar 2026 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xfsqu911";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O92TwV0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36B3C279A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284573; cv=none; b=O87HKMDlQplQv3TVoawZRh6L6FUaM7iW0SNkwy2aA6DVoy7WOSUwmJnLhBpMp3Ld56aZwBaZxutfpxu6dgTnqKx2F+ykycXxF04cRidahX1mA+IiY5VY3EBnXitu+7YWVeDH5wp6Ph6faomv/Nv4355PN3cTacsk3TrTbE/stNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284573; c=relaxed/simple;
	bh=NuBkrkdYP6aIzqIIwzzf++Peu7Nh8IzTYGh8tDvy7O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4Bar0Yl7k/qyg9WuN++npSgJP7rucpHc/y5FwRB6O2+cuCQ4yVe3SAhyanr69jZL91FCKPZRudSgqn3pBcRQIJEhXJ1RSAi6T0Bqw1xgEBysvPGzLSumiGomssA3zYCqpHcN5Jq7zZUOEdLB3n7rCUSFOtgJT1YiNLwDD7jyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfsqu911; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O92TwV0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFHB0Q3288579
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hcVG9wh/UlS+hAvldkdDQoBy
	r7nYBq2QcZ7eFGLq2jA=; b=Xfsqu911HY5HAPQAqHGovqkENk+pRiZSxTtFlHLC
	w3OulDimcRAaMqMKpKF80tZ9K7zNM0vcRw8y1mZPcsRwWFQGpiBP65KHCahtqaSN
	zQx21k+EJj/JkdzkL0GJvUzWYwPUs/vKnWhgziq3FYYjRxl8V6FdsBPpvBPAKTSu
	fJFbIR4Bdev5NkqoabhxlWonT59fS7h2mOa/I2hgrsXVt7Ifh2qMnRr3YiA6Epdq
	Pd81buVyQk80VBGEU5IJNLeBfFCW/ZObkGuu/g5BhA9MKADLb1GtI2sGYi8RwURL
	1TF1P7XRW69tR/pH5mxncg6XmYyY+pN1RtlgcJd/1PIu2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4h6yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:49:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a17ec1eecso27792386d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774284570; x=1774889370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcVG9wh/UlS+hAvldkdDQoByr7nYBq2QcZ7eFGLq2jA=;
        b=O92TwV0qC1g/Qeu2tCxc/eufYJJO09uGemzL/EUiTU/QL+Lk+tl07O8y6vmwZ/tpne
         /Sse4Gula2AgIUCE0uRxeDeBmtm49iwLN6ZW9A3KU4oB44nxVDyoNEdPIi0PS2inWuM7
         QJmf5Kb44o84EmM0a9pzEHL2PgoJT3a9bRepGHjeuuDyBiIVQrCx1T2EIwO8LXsbZYUo
         KRbobK5XwL2JbqbC8dAG/htKvPVmowJMo2rI3PbXoBoSlUU0C0cxfv9XGh41f2kGl+rZ
         Y/KyXWETrlB5KziiMRYw68pWAQGiM51rQXtfCD05DjCyD/Ji8DYczIQmPZhlz0w6UKAi
         xcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284570; x=1774889370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcVG9wh/UlS+hAvldkdDQoByr7nYBq2QcZ7eFGLq2jA=;
        b=LkwfK8ZVL2OOpi9DtGNOSoE65foD/J3LYLQkrER0y703j77sGcx1s4j7zoCbkWVpoE
         piAfIGK3q4g6UvpV6dAF0EeeCxdyLH8UhXHK3gB4qo5axdr2AjIFfcnZSkvgfuF2l9vA
         YLpoHt2ChpqfkVEuoAhqN24bXiIKUfuiEcwQHletRo478wAiL6mEW2UjYXrx2ZuSA4L5
         Y31lQy/E9ldx6S370BgxlbiY46NaINyli1o0j/0aOSkc8/mXKxMreXFSVzEaKJ2MC3yo
         MpmCzu+o8vgv8Ked27JYl1u3iaciEEgaE2FbROOih1rcibw7/kYqlyFtuGxJoeTDyGwo
         Z5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX8s42AIoR77VVOF1wDu9rkj4maWFflrU2Vzwyk6nBevVHwkvBMJO/u/Nmjs71yWqQjFHrhttKajWWAWq2d@vger.kernel.org
X-Gm-Message-State: AOJu0YyAEnx3cgMdPoaADeg8jd/q76uvl/Ku2vouMzUGgzccERchMQas
	Si6iBB7+mE5x7pa4kBK5NydYlmpcO6CBhogndiboWzH9zdbF1ZBLwUKP+nZgpTl8aqEg5Ucxp1Q
	jHkCs11vNHRnHQn584IcYF2BgH9bpIjjyEngjJEE+wGzrAn1RLWFUc5RX6fKnuVNUVT/W
X-Gm-Gg: ATEYQzxENCCKrGNyHxshfqVC1UU3YR/Di2HYk/QkxiPqgbVohbGNSIJltqqRaJTsZ2k
	LiUvN8Utk2rHbgjjAmvC1YMqFsGeoS3iawf3kNurxnmY77vJ23xRvyWY7ZNFwxUAFffD3iRrbyl
	1bQztTkZma+6tBWKeS1NMYx5HML2/aTDjSnwLdCLzeO5vhFkO8GITTP7WGFOzEVRFuLCWFSc3hw
	5scVqxv9u1QqIhiqa+G1Y2fOOV/h3vOveskmChLsbktrHRneF/APg+fjekX8TxyQcgxmHnNTB7d
	y/iDR0IOR9uS8JUo6bF4xqgrZeD31CI/a+HI5o6xS/houqDoH7pwIONApU9qPm6+52PqiEbXuXn
	g2zYIwmkHsdrxQnHeexO1Fp2Omd+i+vLth1hvE2edRQD1dWufjUa/0Ma9uBoFuPMZuatPHnkVv+
	B+2DhFmC2PM1oWKnxapy5A0UTfseUL3IrZm7I=
X-Received: by 2002:a05:622a:8e15:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50b374f5c91mr186754861cf.37.1774284570045;
        Mon, 23 Mar 2026 09:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:8e15:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50b374f5c91mr186754471cf.37.1774284569630;
        Mon, 23 Mar 2026 09:49:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf998202csm29405111fa.26.2026.03.23.09.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:49:27 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:49:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors
 with Hamoa
Message-ID: <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
 <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
X-Proofpoint-GUID: GW4qUDSkY-IK9EzWp2_ScCw6b2Fgn7hk
X-Proofpoint-ORIG-GUID: GW4qUDSkY-IK9EzWp2_ScCw6b2Fgn7hk
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c16f1b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BtDBCqDdFlqQZUnCIJYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNSBTYWx0ZWRfX196L9goECfSX
 +F3pVhYqA0JRZzGda6nGUQzdnrwCbrtEGAmfP3craCN4TSabxNe0aLezvGxUeqcaMCnRxEKMfOR
 NfrDm2bRC98rnDkgSYR5LuPGC2DRDBQAWCpPdwvhj3wHsqveRyBkVezrnRPrmjW4X1cqPeAD+RP
 4e5svfgmFHmzGa6FIl0O94C4NYJjopqfDTci7MxxbqJo/hqbeGgBs42FFRMN30/t1TLQkI2m8S+
 FpiEC3ZTnS+SwgLIj9zPm9SDHcBnneiUT8F1B8itfJQdhZ2Duj4TyOk+dEJWcBibX20I6hQlEx+
 m6rxxdD6ocfDKQwe12gNeP3ArD0nZvAWt7k4cxvLh1joFnEwlMgUwrpMWj4S5mwnBf96UCIn29e
 LSJ2lqaK2CLEvvsRVNGWpWreSdyYwzTbCPkr8KhASfDqtMJeuATogSpBiils1B12RIyFg7gwazz
 5ayTi1VFlq/pBvDp/GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230125
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99361-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C524F2F9A1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:21:00PM +0100, Konrad Dybcio wrote:
> On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
> > Hamoa and Purwa have pretty close thermal zones definitions. The major
> > difference is that several zones are absent (because of the lack of the
> > CPU cluster) and several zones use tsens2 instead of tsens3.
> > 
> > Instead of completely duplicating thermal zones for Purwa, reuse themal
> > zones from Hamoa, patching them where required.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Slightly reluctantly:

Why? I'd really interested here.

-- 
With best wishes
Dmitry

