Return-Path: <linux-arm-msm+bounces-100270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLHnG05gxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:47:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5993342D40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6831318B78C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD72A3E025F;
	Fri, 27 Mar 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bG/Kehax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nq70Q2v5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56A3E3143
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607689; cv=none; b=ZgqtnlgweNT7H9G5yKBwQ2jGtHqGNNBprlqY2WnrpqK6piMD7Qjd31QpPlXCOUkXXWKa9nxfKTOCakRq0V6dqFuV5ogYSIItlEQG+AzjBYJU1HwCAvujQoU3OWUd3jMw78pn0+FKn4GFZrw8mv/kpyDAPT6f2+6tMIaVBTj0Gsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607689; c=relaxed/simple;
	bh=zHVTZpHTDvuXcER+iekK5FZdPaXCXkChq8D96d1FZ0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPkUeMvXKu/njj4WRhQidDCrw8JMRrotO2rPNVM3D/iyiOzjt7B9cJucTSSS9lbgJ3fjGJxgWgR3VlLB9RmMUmBnjScyRbBHSpqyFWFEY4PnrS7DwYhNHaOla70k9U7az1PeFn6og97FW3GhT+t8tzc6J/HUbE4W9sxnNluhi00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bG/Kehax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nq70Q2v5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vpC6298526
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7ZBDbuE2fq6hvOfuwI1jZUEIplOhdF5KT/8Xms48L4=; b=bG/KehaxCjJdS0ZG
	STZ4lfo4a6bgLI5liA2buFRHNc8PXPWWaW9L8XTUt7rhd7cbQkXCiN6MtqqUe09U
	mg7s8kL6G7VChghzwVxPFt/dpdlgiNcgQlnNsQBc2ps3js2cyWIlJ06crErsCYGg
	5PYGXmMIPzLbLIaBWVxn1MX2D8uakQWgGI4aD0+tAFbz8pUTED23o+sElZP9/VQV
	plZESEOJ4qBqBRjvvR0IuV4UeJmwYE+ccyz6RGLRBIIPOkeVL6HCD4k22yYjlDD5
	FshwrVKeLv7O1FUt6HjaPbgxdrqRqUY7q8PWsmWXWYSBYt32w6URDzrkEFDHkCFj
	56+sIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tq1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:34:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2d15c360so4924671cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607686; x=1775212486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7ZBDbuE2fq6hvOfuwI1jZUEIplOhdF5KT/8Xms48L4=;
        b=Nq70Q2v5L/nYNC3F2GjOBVJVDa0zgFzbWvpHNbJWmMM9r6a9exwJcjh38GubkIbvRd
         xzsUqHYadf+j8I0RuBVbFv07/o3azb5rALAIevZZUe79ihUqp65+WqLS4wz+d4/it0H1
         8BylNUNjZhSwtdzr23K52f+zvkYFOuY9tEV5JMwien7HkNcFEhCV6C+zcsT72sSkvIhe
         2erFbDQ1hIIS+xoWRwopZo1uldjydSk+PEUw8jh3ZRGkTtkjKEY0UCKjIR0+nfELFTbc
         juR+5xkUiXphDc92XYMx5uGGv4a6VYq2v302wTLsccVdzioDVAH04n2KjrdyI2lOoJFF
         jVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607686; x=1775212486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7ZBDbuE2fq6hvOfuwI1jZUEIplOhdF5KT/8Xms48L4=;
        b=pTr9NkeWEHbfmN22pKlqopdDUsfM8BjOle8S7Cml5ide/n7nJhyjuHVeeAsfrchH7H
         xgm1AA8UVAZrA36xbMmamz035vBE6PZ6K13bisu33HYQzbrF2PBArlrt9F5Z+HNSOBzG
         zOsoDXTNjyt7MWnOQBKlKPalVU4IleHMRLBmrG04FBoX7H4a7Nnw3sVofQxrQM2TMcEi
         Lrf++rK8SlqnV3hEfufQ26+/uurJjNEyNhydVPXCra9V8w+dCd97a/HAGhwAURiP87Xs
         otOz3dFYoJg2Bz3kLtPeqCCKZVdl3p5KYVhZ6mnaGKFnUNxxCisRVTZVyRMFCdN+BvAw
         td+w==
X-Gm-Message-State: AOJu0Yxgmexql1eqHVk9ZMC811wAGgrLrm2jUs8UcNFD8+4lgSDBV/Oh
	m1b+PI2BOgw6zXMKS345o9urUZVnSmKT4lVB0IimhTG6ktwu3NFuh1OpcIfCzW8os0lmbNp1rWS
	QKrRHGq2xQOp+nOLvt14oWwDejeI2DSzrHevRoFR1KGDVEZkwposFRv4ioJ2hcOvHfDzq
X-Gm-Gg: ATEYQzyYpR/57rxjs1rrj7BoPOKSl5uF5WeQcpSwiE4wavrbYrAls6d6Gw7agX0ms7o
	c/07gjEwCpCge7Qsp1s8j8dHUkvXPht2jDjLzKxL3/eU5lXR3qaw0y9FKhSQ2ZOAWHj/2ZcuySk
	oOTIn1vJEoM6WMFG9oEP99dbfBM064Mcv3mXlRu/gx+mzgNnr9Lh40vn54ng1Eq5dumcElO2F/i
	Ho8AeqowiMRnxAm1Ca53ha7iHIXuAYyM77lgzuFE/X1McV00aNVEDeM2p7WaDKMHDA3GddQg1o1
	XaJGmiaFzH3T9RGSFO/XHsYvgMwIdh/2R+BTd+nVBdTvPV78pF7SA2P/8MD5QLHiNsvHr6SBOk0
	KGNEJpnr9PFLSTp9vMWCkLlkjZx/MciqB77CrDm+YZmN9yBb4/YPN8DuFI60BipqepMhEct9PBN
	Py+T8=
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr17410821cf.7.1774607686170;
        Fri, 27 Mar 2026 03:34:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr17410601cf.7.1774607685717;
        Fri, 27 Mar 2026 03:34:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2021854fsm236805266b.4.2026.03.27.03.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:34:44 -0700 (PDT)
Message-ID: <ac26b598-78ab-4cff-8fb2-a1d657b1c478@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:34:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] drm/msm/a6xx: Add support for Debug HFI Q
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-7-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-7-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX8h/oF8qbYh7A
 TWKy5wgyU9wMZN1X0nL/0No+m5ZPmleEPxVV+Exn1msBpDu8QAwdSDyEs5o9Wg5WgSTt2J0Nj/+
 2mypfNw2Hvq0YLD/CeHurBCJ0fBKyiwdbOfTHdHKzvLGh9AKIqHxOauT3CUNxI59qPrp5DnlmkU
 VE3g0WNvS0RH4RHb0r+NnaLTy4g01Ga4KPs2EtzKKvd1EVYwTurggiasnSwqrPRJ3VQ52ZBTN29
 tG6xuKGrybV4Mj9pfiuvinLOPGaSuVDZE6oLVgu9SSNAXZLO474oPyoa3MfnUymZSeCTkqVeWeh
 3vfvarhBM3CxpHIrcoSRjAhT7ltMHlBsPPicQGbru0TGcf94wUCbTgSfHdsnoH7wrkXVnNi6ACv
 9Tu01f0rYSUZoWU/go2elFdX5w6UeZ+yG3Fd/JubrOgEC3PmH+2LiomFpCjam5MtnfOQZ1ffMWO
 Kh7/kWpokiatbXWDulQ==
X-Proofpoint-ORIG-GUID: 9Pnm5Ofyrp3tgkeID8rD_gT3Kynf3DD6
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c65d46 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NOWTvYqtYlfs-YhqgjEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9Pnm5Ofyrp3tgkeID8rD_gT3Kynf3DD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100270-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5993342D40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:13 AM, Akhil P Oommen wrote:
> Add the Debug HFI Queue which contains the F2H messages posted from the
> GMU firmware. Having this data in coredump is useful to debug firmware
> issues.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

