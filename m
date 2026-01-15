Return-Path: <linux-arm-msm+bounces-89282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA456D28A43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 078D330F0812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863EF322B83;
	Thu, 15 Jan 2026 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFamVdnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUaC/To1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84A322A3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511168; cv=none; b=V2BcxYM4lJq9iByAjHkrJALOc7B+YPBFLR1pHnbg3GGkTEROualWIrz1Zf+mJHBvVkCYcBfgovLgDoEdubtr4PRXNspfFa5Gys5M7vM8vIy9y4n9+WuRmB9JwB/pNU6XQyzUJEzSkyL/az+1VVVBe9riYyxq1ErPndxhfuush5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511168; c=relaxed/simple;
	bh=Qsel98DzKhpD+mNQPwuTexW6pn1tor1EwEPBgOtpcPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AjZfNMHwt0PeBV/DbvNPZZqBEZEMNWt+Ij+1CYvgU6hcKzYSiGrid/RaJM4NS0T7KcjOUcxT/tv12rgkKLg3EQlC7b3QYz1TxvInMmETt0mHG87wKWGiMrqGgQZPYaL5qWFaEjxgjQSi8FLpOV+v6b+P5R0j8kILXTSzCn/JQnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFamVdnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUaC/To1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYAKI2673527
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=; b=TFamVdncmcNm8ThG
	3v3aaGVFgrxTO7VopiZrStqVvwa8H4o4foFB7+MwTXnAl8A5GcWxEPw6B7KZyXdh
	T46EA5O1Vw3Lk2xz+LHzuCcSXzI5t43IF9M7QzZYVwOzqRTnsA6V/pB1eyNUu0Sz
	mXjpQfN/3bpXePjDZH77rBIVKzkJRmud6K7BbH+bByk/JvNB4iKdwZxFomNsCAi2
	6UAIIdnofd/95OMzoY5MyUrGE936IgUyZMAk3P0SDgc77S3xseSqdEsNLkeXMS/X
	DQ7BI/u4S2eyJfODa4Ykh0Yt7FVYC1LRzZAQSoNpgok57pr+4+eUeKQPNc67p5n2
	vyK+KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpyduhm1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:06:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so333497285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511160; x=1769115960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=;
        b=gUaC/To1bC77/3OwXgbhHCtQsm5QraI7IhAj9nUc2DCeVlXBXhJRS12Cg4ALP+q+v/
         +Yckd2pBl88CDb7/N4b+D/9WdrV5MGWhpp2ElVWf3GriXnCNtjqzAZWRP8Tyu3Y6NDT4
         Hb5AbJMGjzE2mKKPSBFLqbvNatT6pe1mvsJ4rf4yrIIzfKsnMFb4ntwkT+IMgJ6PH59d
         KTkPWqBW5rDyO5dvPHiAbHqQcM7Yf0fbhYMogeLe71byCnGdyfSOc+kkcJi2VxfuPfxI
         vNiR6jm3CnyjgqcbbQy86B0Xe8+FXjIpRV4yFjet0AVxv2jkumoCs6LZkRdCr5Vm8Jaa
         6ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511160; x=1769115960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=;
        b=BLJ2sJgGeI9fOoL3laqoRk7uP8I1hxQMVkVEa7DI9bIiKj14WoO7cBLPpM1HkcDp3R
         p+xUb5QvfUih8mrUOCQJFE1Riq88hveX0bz6dPbIEn+Fls7okbZbl5/EQCBCFmeWqKFJ
         WK2sCD372E3W0JOM0IWL3WTxEoaulYlpj7bl04rDdpyJHl6ubDx7nW8cOwKQY7a3EM35
         o0q2DVaj7gfN+LAZD1P1n3xge+Ctl7JGu140XRDjo40R5fHBwzXRrpb2DpDewFtAPTC8
         Ak7o5s/KQkS6w4YTXUsTkAkW4nLxaU5Qx54cVrXskpRQn9M6lPeYrgyV2SG1jriH9UAM
         uu0Q==
X-Gm-Message-State: AOJu0YzI9qWSW2cRL1+tTObhoK4KuoexK7h9znaFPzooYHguZHCiY3B8
	o3ZdLCJfr81iHBOICzU/J69IjjuMgDuEUqbrIWfPbW23bGn5UYWMkg5N6ucAHUMugZx2RyyXPHA
	rW5CoOrhWgbA647Hylx+Cc/SCbkfQuFXGNm8uh8cYY5/8kyVS38bnugKQKgHieXog22TA+S8Y69
	xb
X-Gm-Gg: AY/fxX72nfbSMmRwqIz7H87rq94Eta2z4WtfixpBTXoIEhMYMTVCjSA1JnIYnBU4/gP
	klH1K5CGa2EvXaYOHPEmRp5echUPRF1oe41pw/PX+P/41c45Ng1MCkcM4rOe5S5E3K0e7dliLiG
	Yx5JJUudtWE043WkJ/8LzZzbsnFysNkaMY3u4fEawjtrT+PAsfEtURosvoAcPKecTbD3W7eCUS2
	rbcDvs+3nuf/1cEe7yiSVclnKOaMT+83hjMMNLy8ntEPYWHOiiJo4WJpwGE3aiSQY2HqA+IU6cw
	IPjf+WOGo7zlX84ApXdk7DMt8VV14smhYhQYvpO/+3AcWhUVUCp4o6sRjdQ9eCduIAyc3aFZERf
	Rc0cr1JcAuclx7NM2rg/1XWFPHkSiAv3D/DIARvaCCABOmxj2wdlz82XhqDi6AupLVc2vxyUfv1
	tFplSlwFsbe0wnQ4udQo4MrWs=
X-Received: by 2002:a05:620a:4088:b0:8bb:9f02:489e with SMTP id af79cd13be357-8c6a67a12b4mr109696485a.74.1768511159559;
        Thu, 15 Jan 2026 13:05:59 -0800 (PST)
X-Received: by 2002:a05:620a:4088:b0:8bb:9f02:489e with SMTP id af79cd13be357-8c6a67a12b4mr109688885a.74.1768511159042;
        Thu, 15 Jan 2026 13:05:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
        robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] Add DSI display support for QCS8300 target
Date: Thu, 15 Jan 2026 23:05:55 +0200
Message-ID: <176851111172.3933955.12274071236835720436.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260104134442.732876-1-quic_amakhija@quicinc.com>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfXyNCpPkEja4SP
 w1gFoXEmUKkTUPBELw7J9F67tlk9kassriACCB7Mugf5IwqJ/C6xkHr3IiDIlL1EUWxvNxm8Igq
 oNk4tPpFacQRvcae6e3d+7xO/HzBifQenyrgJIDtIwpBefCGznhVTVOozQ9EjeR6RRaV/HeNy9l
 7lQ47eh0u2PD20Xxzv12YiCiAPyWOvsyHZCZSsR7keaFEOjxd3WdTp/1TKeoyS60ARmK+YAJLiZ
 78D0LjYbKtAll6iX9puntSqaTykh+JB9ZVnMps7nx2gg2gVBqxwqq0crUzOGL7NY0fvdQ0fSmb3
 XVcYkFQ4QYvCatgP6QdnjOfGNTCxehEy0mbjnGEnwVKajoGkMdqYRgg4AFAViWtMPmC20SLJsPU
 e+1q810lrGTYcdrYEyk/4XATLIAI2hhH+i3FS8qK2ka/Mej5gCe3N1SOlfJ+0U5WRO9+M2L3GAI
 fYQMRM1P33UZbXC0ckQ==
X-Proofpoint-ORIG-GUID: Qgpxa7rfyBVkZ-NvFmooU51G2uM5Ao4O
X-Authority-Analysis: v=2.4 cv=NafrFmD4 c=1 sm=1 tr=0 ts=696956b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=s_x85DquI-FxRm-hfV4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Qgpxa7rfyBVkZ-NvFmooU51G2uM5Ao4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Sun, 04 Jan 2026 19:14:37 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge port
> (labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.
> 
> QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied to msm-next, thanks!

[1/5] dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/969c948d1392
[2/5] dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c42973f92974
[3/5] dt-bindings: display: msm: document DSI controller and phy on QCS8300
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5aa414e5c78

Best regards,
-- 
With best wishes
Dmitry



