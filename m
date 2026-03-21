Return-Path: <linux-arm-msm+bounces-98987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMuRIVRCvmmhKwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:01:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E153C2E3E18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A58430484E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 06:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CF5375ABD;
	Sat, 21 Mar 2026 06:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zzj94rnT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWrdmkte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A1375AB0
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076346; cv=none; b=Qxf2y7/nT7Jl3eRU1hLLTGiTxBAvy0CGbsNNQuJGSksxn/K6SunltKiUFZ08rjGxqYdu7GiGjsJSIX/3gxO3pda0gxOQsBpeGK+iqUB7Oxy0IpweXNlDIQmDrVhkgQ8VDsAcqiuJmfyZW9u8YgdD45503r+9XQ82zahltbWmktM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076346; c=relaxed/simple;
	bh=IFD5pZ5z1CDvjhsF0xJ89+yf4zi1WdRjxgbYOUYYV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR/g2U8Q1l6OIsngS3O1cdeJtDmZCYh7H9d+Nkk4KzatQc0o0/Z9YZgEyRJ5vOD3OalcePVGdLinyfSezbr95DWz9t9eewlC1FPImJbv/pKPfXNLRTROiMaVrUo9chf8hsK39qzXuxJ70/YByGvBEieQXDDCksX2RAQTpZaRvg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zzj94rnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWrdmkte; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L5SPvK1539143
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+2/fRxb5vN01Hzo0dKPOZXNb
	ZC1yFJ9Phjhw19wLEiY=; b=Zzj94rnTX2nafsy+2hgrszmQi9W8jTxbakeriQiD
	mIodMWz9Nmf9AHWSt0qmG5JWpGh2bnXbKR8V0x2o9ndGjVSKp90rQws4T0Zj6S0I
	Je8lCRmeBq8sK9X0hhfN2VCNq5a9J3/7puLWb+K6a3N+5cTILcMbOh/4b54/FN+a
	Yj33YhhqX87w8P2a4NbndP6DBRXMHOpM2EDht0wuVIAp1vF7G50fRVMhZarPfzg0
	CuQuCDtBczFTHlhdjy564m+PxvgKFsE/Auq3mlyJzIVqeWSI4YhuW4G+f7pAZiR8
	T/2PnZhPIamLn40qCbyR+gHCZLMPJx0z2bthgs2SGXx5pQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cr6n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:59:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso50994521cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076344; x=1774681144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2/fRxb5vN01Hzo0dKPOZXNbZC1yFJ9Phjhw19wLEiY=;
        b=NWrdmkteM+g/GcVNP4TmhizdEO6KdPxOqNkLvlf7X+p1EQvglBlLPKrbXdgcGqMHs8
         mncliuSikW6aWyYwsk/tUIfraCCl4cxYk7yXGWZfQMwR5bkZ3xVQ7mkUSeJxB5MXFVW9
         5MgddMFic0vFWHq5/YHzWeRQidkPjQRegckWGAgxuGlDj/dcxHtP9ceeJAonpCE9wyHK
         kwb4hn9ms0mMnEcvJyUUFQJOkAMOUb+3rB/D9qeqJKDoc90mdW5Mt5S1T4JxegCGMhN7
         Leo8oyYkcvSv8sOuIqG6sj9Yh5hIagt2HPz1pv5MWUB992mZp7IvGCWeLdi6qNnS9Ob3
         Zgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076344; x=1774681144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2/fRxb5vN01Hzo0dKPOZXNbZC1yFJ9Phjhw19wLEiY=;
        b=E+wrgjMpJ2HrEP5GskRPv6kz4YcrVva88afVe9piQ3n/6TxnyzhHKn1gU3TN4KY1CZ
         0mFA5kgxdqFUtTekAU2K0xWeJ5gBz4Fw0C2v7nDAqHs1Q2ELn3o03Fs9/7GJI/Qb3/wp
         DoBc7cY4qKqOCqt1NGYmX+TJ+PQ58qjlvrHDbRq0MP7EoPJWUgJbUNdx+63++Cfjd+BY
         p1ocFYraJ3P1yuPTu/Z/kv6yDTjeqwgYHgOxSfShCwjitE/OVxdgzRJtdSWwSg8b8ArF
         J3abKiKr/w78WrBXALz3p8RyFZHXw0YYdLypJAzQTzidaot4a19QnNKj0fX/r4t4gi4W
         J7eg==
X-Gm-Message-State: AOJu0YzSFO7VPq5spFhg0Way0RCOHhBaxIFPkPa+A+K4MK/cQdagSsgF
	NWiipp4vQc8vHRQE2mymnqDeglrUENXliLHtx0RAKV/+deRqMJrH4MbezPdfz7T6tlycAf/+6g9
	wnt2Yp5RcoE7loQVl0guQK6l0UKIVA2JqS+lngf4Fjg+4xcYqJwfwwUyLZ+NbebbEcUvT
X-Gm-Gg: ATEYQzzM9m/zvGhn8SpOIpwCtlE6mpXQUwoBohBINCRAlHr6Amu7DpLy0kqmlZJxm1K
	yWSiuME8jevYTvyc59azxQN52G1OwpMOl4feK0qUIFE/eBeUmWWwP1TC0TMgubwcOgYLbCTqeLo
	l5ZEhyCC14iP8L7VgqgaWkJ/KAIP+UO/z4xmMgkZEyspEpjr55RXOmGp95VYOO+yZJwhL7b5Q+R
	dT1QFNdgZvEaTjxOJzrHhpCo64K4XDJsskzBSO6ufX/sKsxr+C6kjT/F3/TteQoREKClxW3RpQE
	2jZxyuiVwKZtxgWuSJR9fpVaDApZH+RnIoDbToLNdvnQerhGOASz9zVGSTHD7Z91szLBlg/7qLv
	zJq1AxJ+bwD7TkN471aBesjTFJNTLLeA6iDHOvKwBE2tfKcFo8Jn+Gp3yEQqapYY7ZhEO0UWn4B
	KxmFBpg20vzXWTImg9qau+DCJqfi90NcfLXRE=
X-Received: by 2002:a05:622a:49:b0:501:3ccd:cb3e with SMTP id d75a77b69052e-50b375b8448mr89177121cf.66.1774076343690;
        Fri, 20 Mar 2026 23:59:03 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:501:3ccd:cb3e with SMTP id d75a77b69052e-50b375b8448mr89176961cf.66.1774076343238;
        Fri, 20 Mar 2026 23:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192ab9sm978951e87.4.2026.03.20.23.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:59:01 -0700 (PDT)
Date: Sat, 21 Mar 2026 08:59:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Lei Wang <quic_leiwan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
Message-ID: <x4scfqkta4vc3utd5fy4wbfltk2tlibbejsc2iohjvwe5lyaad@f7hcbxc2s4dv>
References: <20260320205933.992852-1-rrendec@redhat.com>
 <20260320205933.992852-2-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320205933.992852-2-rrendec@redhat.com>
X-Proofpoint-GUID: 8Me6ulOUvO7DOYpOLHuDkROmK-5DDd1y
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69be41b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=sN-raam6ct1y1SKqkBUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NCBTYWx0ZWRfXxprCIK2i3iFJ
 bmTFDVAWcR3v1SD6lBZ/vxIjY8KtsoPtRBLRtb1eETgaPeL0UrrQdMtc2Gtpx68gDqSoRnjUUVn
 yCVV9fWq0dXmyXhRUpgWHqVlv9KjOqFZu6GeZIh0L6sE31kcAOChVWH/B9k22Z2PV852Dug2YRX
 5Wmo5auZxZvSZxUqVxs+jqltrKQXW/NrP0PbMFSqRNzm3xTs+0QqN3oAe/v3QltiqM5l4jbtxwC
 8t5I3eVw2lHrx35jAIbefzoHbJB0IGvfKgm2pbDN/lSy+MSB8013PKNHArKshwCm8tjHI1RnZM9
 BBcCa8EjLBfK7IoZl5zYmeo+6AlCUQ0vM7yDtvJk4+Vejg7dtSfMo5dE2I1ln97Sb1VwRPNjnZ/
 ty1Y8nTeHLMvY64xcCqd7gPlOnkNPSj2Y/26de2oN/GhryLXdlEK/nLdikv99vGrEBWZttwY8RT
 I34rdCWRAN/xq2cO87A==
X-Proofpoint-ORIG-GUID: 8Me6ulOUvO7DOYpOLHuDkROmK-5DDd1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210054
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
	TAGGED_FROM(0.00)[bounces-98987-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E153C2E3E18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:59:32PM -0400, Radu Rendec wrote:
> From: Lei wang <quic_leiwan@quicinc.com>
> 
> Add unique ID for Qualcomm SA8650P SoC.
> 
> Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
> Signed-off-by: Radu Rendec <rrendec@redhat.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

