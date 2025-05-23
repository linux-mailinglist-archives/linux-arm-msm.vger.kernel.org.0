Return-Path: <linux-arm-msm+bounces-59235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08FAC2890
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802403B44E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7022980CF;
	Fri, 23 May 2025 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ghp76XFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8022A1CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021130; cv=none; b=Myd/DaZrPivwGjOkbR7/6Xn1PMojJGfec67ao+9HnOd5Gl0Af6AJz84BSx8j/QJFJ+gKaodSvk64XTDucYMWuc4KwIEafE7dNeKLh5V+160lNyRjAdBBdNgjyLjxwNA67+NgKcu9Jxc7c3Dw3IdXhqQK/H0qP3BexFo4B889tek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021130; c=relaxed/simple;
	bh=PTxY6WsC2X2PekbIkKpboZ7KrDdYsMulX9h1YsZZXoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnYydQkzUiENoJrl/inWUst1N+6ETXsBhECnhE6LovfosYg0yYEDVeZX7L8CuXiIUGVDJldE4juh9apAfnin+r7OiQZDVT7v0ntWUFGJXgsYPV55bEuuDnfvWONQfnrUyUu5z2XoZQPJ4jjv1ZtrDqxGTm6k7zij/1c8jJKHjKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ghp76XFy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NARAQQ024754
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tdxr7rennTE7cs0ATC1cfBjl
	DLm4FEAfB3HTzgMnE2U=; b=Ghp76XFyViOTZmuKLNGaPfX+YY21BvRTVX1Pjzx8
	24l2Hax+UxAOQiHGDRLYN95kspK2EC4lHPvBU04cx+jENl0/ExSNsrTTg7drq70B
	cdwn036H6EwbrccgfkdLhSR1TXNJIreCGPtoI7+XMYj5kW7LSx4MPJMdrJ4LcrfL
	nymirLLHwGDmjl1HRlsmsyGkBp069NL0twLm60mH5rrAXy9jKIzuVIRJ7ZgUPl68
	QQbovk6P+Ei9V81usMdK8xMfVfUnPbTrmPF3EeYjDF1HVPBsjPBPgd1hSHa5Kn8M
	NMQT9/YMoNDjBEhBMgi9mjoObfPCaCieeudA9wksdw1gSA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52nwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:25:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e114ef64so1298406d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021126; x=1748625926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tdxr7rennTE7cs0ATC1cfBjlDLm4FEAfB3HTzgMnE2U=;
        b=uum4BiDugoLRnrUqnIwctZHxF+JWzx2VfsioboVfJv/9l9/RgMQ7Efo6l/E95XYZ0d
         5PD0eZGKm8yuQHfyYnRPJP/vyO2Rdepksp/MAEMcAIYVslz9QDWFP9ULzJNhEDNw73JM
         j8oTUP01zltMhQQe53Jzq73tfUJ4JOT/3oZi8Mz7wS4xmozbvu6ufhopzMvJf0MEoEai
         N6mpddxDyQ9oZGIsi//AGzuQt7EsOO63+wrtCVj0jgrZ0c8Dwf+eDW2RwTR7pKB7Hv7c
         u9SxhTDXAynyHu0NyTPQVvb3B/mH0a26mX+5FiyzUBCf0fIdUPWqx90Mo1ghHCWW9PSB
         0owQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaANZB0VDw+qGd/hzHz8O8ThggtzELhGkQujjKFCUnBYxShlsZY/IKRY+5jTbEXLKqptEcccUcez+ewDq/@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSkQ5PY7+OznfAql8+GnOaom7k5Z2+I5UF4zx+hU+uPUbi0Zv
	wli1sxyuT7vu5ZrDr2emmp2Qh0pgEYSw1gwJtfmqCpnMpfBkDlb7c/niemL6Gpv7RO0h8MdWww2
	Mei7ssljFX0MzZWCNtQFNBNk7h9kvdW7SGKmPs72qZYuCdAothyiZ21PhCd5MzVSfb2yt
X-Gm-Gg: ASbGncuPJqqZ2+EdV17tuCQWhoIGqLNzNxF4XKXa7m1aFnjwr5VwMIyBUacbjXu8kLe
	HFZ3W6lD9Yk6Ey9i700xJp8d9jKh82LLlc7poekr0lzj8PY2WkFBrXBlgrKwAk2DW8vK2b3q2qT
	hRsQeaShzcsG5RuXlCq1k4NyrdBCQOgVXQMZHOeEULojFyOwOVnlb2u9pvWkQ6gryjGvvDl8NTK
	sNuYYJz7COsN725G/RdOqzTLXIhiV+mTRlbIz5PjdFl5ktbXZSJtBNKR+4p049YvwxEhe9XpguC
	3Wug6QSQZUnR5VUTppQaKUVwnNV8AaDw3IbHoetL9nEYF6CKZNo0CmyxUnNfCI267//YQrMWO38
	=
X-Received: by 2002:ad4:5c8f:0:b0:6fa:9c1d:91d4 with SMTP id 6a1803df08f44-6fa9d152c62mr5086886d6.10.1748021126050;
        Fri, 23 May 2025 10:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF10CtBQ7MB0ocIQwHT0jdYsIXmmW0GyMSYYOoAlWH4uSN4ksaM2w4jkjkqRjHL4lOPoy7foA==
X-Received: by 2002:ad4:5c8f:0:b0:6fa:9c1d:91d4 with SMTP id 6a1803df08f44-6fa9d152c62mr5086456d6.10.1748021125678;
        Fri, 23 May 2025 10:25:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fdf900dfsm1958347e87.60.2025.05.23.10.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:25:24 -0700 (PDT)
Date: Fri, 23 May 2025 20:25:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] arm64: qcom: qcs615: Add ADSP and CDSP fastrpc nodes
Message-ID: <il6g7ly2uousixbuqn7qyvgsxakok2fxjxejdmmsxfvoxcmzan@amdtirihhfhb>
References: <20250523103853.1538813-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523103853.1538813-1-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: AbhgHk0pv48ncdVRHDHzKw1LBD94MILO
X-Proofpoint-ORIG-GUID: AbhgHk0pv48ncdVRHDHzKw1LBD94MILO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfXx3bttB7ZO1Mo
 GXLETd6swrPcUES5O5G0zcbYdy5KFjJS87QdOlIbZSa6IivNYZaH9B9dfs+M25+9+3j5wRt95iP
 +EGKcLS8SFPkcmgS5c4K4xbyfFLJ5FDQzoO68eUBnjfj+9DvC1r75k4bDPoG2LA9bM9JhgcK8jU
 zeUxpkIgkW12ZhUGUZlstH1u3Ld4sCRQeMKJAGiJWGeHOhA0sTvlz5IQq5zkJf/G1SEbKjD+Hv0
 HO3afq43j71T/MsYhlkh+5ur6JhJK41+PdH8JtGxZ22xz6Q8q9jxV19smJts9MZaBhqRjJeqKid
 50F4d3kHvjMZtguQe0tI7ULx+7vqIcPI7zCGO/SOxfSopyjT8K3JtFl7MGV5VYZNlqOlKq3OnFh
 Q+I0vVPEE0GZ5XSPi16j/jKgTXWyE4XHk2W8dFFT0syjfEMO5XsdTPlyoZO39o6GUUAeq19u
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830af86 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=-UGrW_4Vx8BdS2UjCj0A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=647 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230159

On Fri, May 23, 2025 at 04:08:53PM +0530, Ling Xu wrote:
> Add ADSP and CDSP fastrpc nodes for QCS615 platform.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
> This patch depends on patch https://lore.kernel.org/linux-arm-msm/20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com/

That series needs to be reposted (see the response for patch 4). Please
fold this patch into the series. There is little point in having a patch
for not-yet-applied series, especially if it can be easily absorbed.

> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)

-- 
With best wishes
Dmitry

