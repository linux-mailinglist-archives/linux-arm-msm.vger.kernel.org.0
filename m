Return-Path: <linux-arm-msm+bounces-89933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLUmJjkqcGmyWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:22:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A37A4F03A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C85B802F08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C4930DD07;
	Wed, 21 Jan 2026 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGIQMPlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLYmxcMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8478130C36D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958431; cv=none; b=PRneYVHSeL7QQPxeyWtOUpI+vffvGdZHFgVD5MW+X4XaJ62BeMpFN/+NQ6atyGOGd/ZgSCPPXGHRw6kECz5+0xLhK7BMumoQ7iwjRWq4NMya3qFe9R9yaRAtODAkWuf84O97CZRpurb9QTCaTXe186KUsTAXoXBwM2wmN2wcZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958431; c=relaxed/simple;
	bh=UFxsZFjoBBxzDzolWUEiJPPHs9TpgdaiRQINz1dfp/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+vKWem8ZhqU6XBUMfqicVqZIBtrZHcxY5EWVjZ/C8MQ1v3Y5Ae/RpXbA048DSorpWHSgBjWe5CoFBXsPg+VaaBZpRqJ49mLg4m6eZreT0uuHNJBjm1Kg7bIvfF8GxR1nIporEhinviMlVtxmxlkpeHHmSr9pdXhQcg/37YtUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGIQMPlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLYmxcMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHrIOo2827451
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=; b=EGIQMPlX7EZRAgMc
	EphulYo16uZm3gNPXZVtG6QlkM4PEm0hKFMrdC6ooiU1mFVUggTMtOaSI9AoC0CJ
	wNFSqblAJyXpTCO/5Vn21upvjgBAeAe8X3/LV2qSerYw74G38zSB1IcRSEQLM6KH
	9bPqZpPmfqH8j+LfYy6bDoI3vF913ROCJA/A1Qp48IdEAMiIdv5nkGCdOltKrR7K
	P7lU+G3bzxgDbVP8qLgJkZRIAHmQSkOBhG3kX4cLTlxEf7s7hl8b2jHBPcYxQxPP
	xikq+e6F0rO1Nb0MCW1eMag+/ESBLwe4xttPn+y2BffTvGM8nYzgXl0WVjYbqzYl
	vVCIew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btegk9d12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:20:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a0ec2496so1163172485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768958428; x=1769563228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=;
        b=WLYmxcMlo/Zq4keyluzgV5Z7BJgGYmvRY8oWrHMhx2O9SahqlZxPtU0VxtrytJCb6+
         wMpbgGN4J/uCxPdk2DPpxG5zmLTscbVxsqh9sMbNqKo4JMtN+7IfmaK7/1LMLdAUVIFD
         qTVdTOQ9lr3VDAh66r2MIckAIJ9hMqTchUOd1vG62zDq84apnPNEefo/uLLtr1LdiK+z
         4v924DVv1JkGBB1FJvv8UHRvaFcGqb4Bwx1QGCE4iit0LkTckszwvmWiIne5TWt8FFQF
         bHlgvFqg9CFkPePGR3DL/vaom+BMqTA0Q3Vcm8aYNPS+CBgTPK8YW58uBRDS8h2S7gE9
         4iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768958428; x=1769563228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=;
        b=OX4ApQYZ6Ab5q/Z95rzIPJQqYRzvY2iAJENUMcRRfUoN8euNn/Y8HC9w3CYyD1kp2J
         WG4J2OEKPi+2CrdM1Sbyf/VLyjNWOXl7AqX1WKnmVLpz7FWeVd9an+DoXp/QR4macquR
         GjDZjQc+QRJ2uXTJB+gA26VnrYz3BbnQ73tvZSKssbZMNQyFye5atF2yxBXouhMcWJbz
         BNU246ohmyf+Cd0Vq2T/gKDA19e8qJ+KGpWVKFBY48YuNoTIvrYhU7V54Ijk+d7lN9le
         pVxgLtOX2RTfBL4Y3Bj4bj+oKBDU6IBF96BSK/5stm8z2EYvp0C3zd0DOiZPV37otnId
         xx1g==
X-Gm-Message-State: AOJu0YxSYyd1XNHXs3rO/x50yvikNeTatehp3/en4iT15dbP7uC++fZM
	cW68xg63/fshmVdOfQ5MX/tZDzn40Uttd+WO7aKJifz0WSjxJU58xZbN6CLpiP/GvcgvWUVCEY9
	4yBUhwb0oZCHi9ClcKRErL1XE+n0CvRX5QojJB3ktgKOGWQY0Po/EALXlGPjQNNgLdpuq
X-Gm-Gg: AZuq6aIWdRZG8HmhaRfYbm0TrH/AX6FgeCR/eMBCYh2yg75/8lElYlGbsdkJ2MQxm+l
	QKL3+qGiDGfy4rwOx9lMa53ID23pEZl4WPNCcoZ/wxj32pFcHi2rS7KCXYXsE7Tnv+Mwe8aSkhw
	qsok9F8n5rV/KAwWL31RYa3d87kG4wQqckcAyKNJBJIwokOdx5C1oawBN92MutWKcVZ60BCtt0D
	G/R1hv1dqMEYsVtt8N4dx6U7RNa4bGA0S5MNw4xc/WJKAhcVfaki61dscRvEhdne6CKy/+GicYk
	ICXAgcU4jCkymyhkeZ/S0OWh6cUZnEO1Gp0yVQ7f56BdCnGWhYIRIYncVKNpVT/yBam3X9AjW3G
	jpl7kuR9bmdKugu3Ut1QBSEe1/eiucUiNC0ud+nxC9q4NgZMZ2pnu51lopa2PKqAkngfqgchxlM
	qUJ7lOiRB4q3gFBnCIZvZA5zo=
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id af79cd13be357-8c6a676deefmr2388903085a.51.1768958427692;
        Tue, 20 Jan 2026 17:20:27 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id af79cd13be357-8c6a676deefmr2388899585a.51.1768958427183;
        Tue, 20 Jan 2026 17:20:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:20:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Date: Wed, 21 Jan 2026 03:20:21 +0200
Message-ID: <176895840440.3580355.4970268867453461816.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6xw840yVXiU74TI14BDV-xbCac5_Btdj
X-Authority-Analysis: v=2.4 cv=X9lf6WTe c=1 sm=1 tr=0 ts=697029dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=s59xupi2FMclaisc2rYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 6xw840yVXiU74TI14BDV-xbCac5_Btdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX/cG74wncfzey
 JnQWerXWQfJY3DXjFLIwDH7O6IzSgwLqzOMo++lthGKl6iYcXsW8TTx471KnRlDqZVhhKU7u/nQ
 5m7r123q7cVkDc3GvTQ/644KhdAbuBR0pra5fkt45cb+7gmA8sEfffcMHRhMdQlRILnrjc9+54R
 qpJtTqsIgPqFu9NuROAF+zL6PjKcfYx1qaoNTk5P8x9L/fCTUmTyNywPtGBbyj8gnkF1fJeNJh/
 u3yA5n9gqbb+3Y8dlKGPhvUvNNFARTR8PrGYMYIBmJnTxICqKDsZ0qHDigbOKVQ8/4+n6dyuIWK
 wxRxIpRWoquUa5cb2vTacuAnB7NJXL7v2F5ghImEcKpaCnAAb5NtxIRVjV836I/pKJKm0wSr7py
 08iKE4AsQhpCB0uEMrY7xBSaaikySt/d/DhfjsXjScuwFau4PtPDmObbhSGY/NRY4wNOUK2M2nG
 zggBV6GPmotKRj94pfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210009
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-89933-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A37A4F03A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 17:27:37 +0800, yuanjie yang wrote:
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> [...]

Applied to msm-next, thanks!

[01/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60772c225f0f
[02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b92efcf5197e
[03/12] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac9d8bf74862
[04/12] dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/526015977816
[05/12] drm/msm/mdss: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3d2d7a3386e8
[06/12] drm/msm/dsi/phy: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/223bff623c7d
[07/12] drm/msm/dsi: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2482c6f93aa6
[08/12] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b78956dc9ed7
[09/12] drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cc4b81f178c7
[10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/688c7734002a
[11/12] drm/msm/dpu: Add Kaanapali WB support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c6c9f129e98e
[12/12] drm/msm/dpu: Add support for Kaanapali DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/83fe2cd56b1d

Best regards,
-- 
With best wishes
Dmitry



