Return-Path: <linux-arm-msm+bounces-86278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C02CD7F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 04:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9225C3000B11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 03:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D95266EE9;
	Tue, 23 Dec 2025 03:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWQXOyJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fq+ejSRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544721FF48
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766460261; cv=none; b=EY5qXWzTel537i5GozkSytn1sLuBQTyIoHTuUkNHb6hFWQoxVY+Fd9Te/VLkoAW/GY33aGmWFUALE7QXuZfcKYoFvFBG5K0yhUNNm5OaGPxg1TzNwfsLVoRmbOeOyTrXH9skQAdVUwlCxngxvES5yPBPBc89umdxJKJmWHR9NcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766460261; c=relaxed/simple;
	bh=IeL+eTH35YGm5sSXFKi4sLCwfXf8ypNoth5fdlvl0OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0Dc7tMkL/QDbfaYlxoXsHdZsuD2Fg/tTr2hShHElDw+QLPl2b84ou2ykPqlgQwflB5MLIDKhycHlsItl5+JbOBr6kHtcDDemoIAeHh2qVXm+qyBdjCLjZ5EiXYsAyZ5/Sb8dGv/mzohMngMb9+mpmz4jxHM9ZuTsYc2uC4PKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWQXOyJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fq+ejSRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMKEomQ4045106
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 03:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uzcjLJXc2097V0w9Cw9cP1j+
	FnVN5njS+BUALgshRFw=; b=EWQXOyJKyJLKA3nSByDu2f6FBVBpNRduaHvWDXnX
	dsxzjTxIIGa+mQwrFtw4KyWyFFXVsyVfxYA2pEAWIcCG7IJbDTPBORbrXGhkPf8X
	hRr1xYqxbNi594tkjhR/Bvox9qF8TpsJ35xnVrF2GdCD1g7kTM0GwZPh1k7mbdU4
	jA/ZImrzf1T8UEWZxHrF7rSKWSMeGablIn6j030gHJ47IgvGMTzrMpoihZ9MkA9D
	RNofz/HLuqbLP1TEkEVjScO+CBnb8TehyiA9dt4EQYNjVASXqvieCfrxM7RRFbE4
	DoIni263VeJwrFD6dNYWDFSeWsJ/GdxLkYbwXi+nbjsajA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuh91kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 03:24:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e9b2608dso946528685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 19:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766460257; x=1767065057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzcjLJXc2097V0w9Cw9cP1j+FnVN5njS+BUALgshRFw=;
        b=Fq+ejSRUHZYXqXN9skM5YDnhPWtr3iDbFiU3rkkueEnUQEqbiRygfAs414firImqVo
         kTMck9X2YoR7BcRT+iKrwUnmBnFRBWjGUI9CWzYvkKVQaZqLvkQSiYwZmG/jIOSLHhzb
         1u7Bb21RmeAB9E/YA539jH+UyiVXPWrjGfZw3ZL6dGBnWiy9mgPbbrJoTGB9Q5ZhLFtC
         Rq4S8vwh7C/Yz11gVqe28H28ASLs7rH5sRzskVLLTixBHQAnJ7hJhBQG3FaWUy9ftSDI
         I2Kh3iqqPbRlc+9JFr4t5u7COAMFx2q8JfXY4k77RfeUOPwutwRn10J67vC/fhxNSfky
         LgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766460257; x=1767065057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzcjLJXc2097V0w9Cw9cP1j+FnVN5njS+BUALgshRFw=;
        b=VZbe4NEmp+7SkyxDsBCxzvhKwtZmw+v96+fpZV+vEyubOXbO73hJz79emn/0kEhuX7
         bQ3juaMTQ5phxJNCqJ0uiaabZh3sB2dYetKChNd5XnZXSYlkPwXTHFvXa+Juk1IObCE9
         LHajF88eWsRQ8ENGvAm0j6RzuUhu7f8+79OLBuJ6YddNm7JrnWTlU7SogKUPKZHUIjZ3
         zgK7Ge2vdKknhK7HgIBik9vFePUNRVjguzdzETDwkf9WqAB3SBQYFcurciFHUKVZh/qO
         OdskybewPfByVAHExe7UXnwMdXUszZfpL5Idjym3UjvpaXFMFOw85mF47jdgvHmFxwI0
         jYNA==
X-Forwarded-Encrypted: i=1; AJvYcCXVYCj+NPxGPnHz0ckDYNPDH2zC7W21ib/ZHSSw5K+Gk3FwON8no8vRq4kMRP8xxpNbxI9u1ReDyl/b/SoU@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUYsiQywCRxdFNxgzq4n7369hL/V3+hrD1X1Ey8i0tk6TAQt3
	fuC/iegTArO0amCitfzvPJtPiIWlP4jIRX8vl8u5GrqoZN8cLRvOaSf1dcUF2LAtpyyGcD6WsSy
	UaU6L7P3dgaCW/d2ajoQB8cchfJHAhFA1TxCyTjJtSzSJM1o3JMd/l44yg8etOaJaQkOj
X-Gm-Gg: AY/fxX4qFBvZXwgjQNOwuFijNzjdhcZ1B2EJgUADlRgE4ke57qg6UD3Y8BPItdDlNA2
	ofI0YKFQ8x3Bqox0w5Y4qIQY/q2DIHVWk7l6iih1YSMlEanbpltG5lW8wXdGUDrETh3c21Rws6a
	Ae1Jm9ST5vb6QOX9bTLaKCdnH0cXQQeDxEmZCxSlzvI/Riq5uTEfHmpiyeu1xl1F4iSvzi0lOH/
	ECAQfgIq6VlxvA8KazDf3c/yiTyQ4rwQJg6if8egLUYKqp/Idrd9gAiEqrGu2UhUVTJPLk3uYId
	sd06eaB1Bo4FKDp3d8MwY0VB9nXdrU9BsHDs/Fck8+Y7AqPWOAdA793wrdTbd740Zy30M0xVC0M
	M0d628yruAgD01Tsy1LXQ6OhBGGR16g2dv548Y6nutGZjvwgxLXnatqoHfAiNDRJusZNPDj0=
X-Received: by 2002:a05:620a:1994:b0:86e:ff4e:d55e with SMTP id af79cd13be357-8c08fbeede2mr1932867385a.39.1766460257509;
        Mon, 22 Dec 2025 19:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/40QROaFLK1fYdvlaAHuTUed6JCbRW9u2WF6S4Bjewg4/g/lNx6JVpUfjFC154rXkAZ7GkQ==
X-Received: by 2002:a05:620a:1994:b0:86e:ff4e:d55e with SMTP id af79cd13be357-8c08fbeede2mr1932865185a.39.1766460257054;
        Mon, 22 Dec 2025 19:24:17 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0968933d3sm972273685a.22.2025.12.22.19.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:24:16 -0800 (PST)
Date: Tue, 23 Dec 2025 11:24:05 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 00/11] drm/msm: Add support for Kaanapali
Message-ID: <aUoLVVDaEvx7jMwM@yuanjiey.ap.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <CAO9ioeVXqVJ=d1xArUJOfz89o0UTVMcUZknMpHSZ-k4RCTZK3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeVXqVJ=d1xArUJOfz89o0UTVMcUZknMpHSZ-k4RCTZK3Q@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 5OsYScUrmzezEyLFyjtDWDjZkGReGXax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAyNiBTYWx0ZWRfXzyCplwUF6k2i
 Ee2wPWHdtCpPmBKZmKJtHRAXHDY2gMwWY6rIevPV6q53PGe4MUJv0rm2gB9D7c48vgX0AqcP29c
 OXHmcKf+mdEWCKxIhs5fAEsJLiNy/ZULKr77hbxSohjFM/QAEucze0l/VjBPZZevU+AWyeRDiEK
 OjHwq+yNEB93Qfb9OqjrCoSYt3hhVdjFGHXKB0Yuoni4a8DY2A044da/5y+Qa+IfhmAajRjwYUK
 uZr0mX67TJrmrZcRaM2auZNutH9ymr36u41VsPANSIClTr13RccgIpKcgW6D+Klr/zP6mw/3bFb
 /35vfFTQz6l+gfspLqo3latBx1kFONDmr5krivLtirWbzNtZslFZCCcrRv6KeTqGVf5TUdbMj7p
 W3LTjyI+vrR8rgzW2gQA8/3EoPmBo/JoK6ISqS88L6/XDFUNqr1uNCUnblsHf5DwqkKwBm2Inmk
 ZITCFyrr58O/1NePQ/Q==
X-Proofpoint-GUID: 5OsYScUrmzezEyLFyjtDWDjZkGReGXax
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a0b62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JB2G29MalyZ09vBlPV8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230026

On Mon, Dec 22, 2025 at 02:02:52PM +0200, Dmitry Baryshkov wrote:
> On Mon, 22 Dec 2025 at 12:24, yuanjie yang
> <yuanjie.yang@oss.qualcomm.com> wrote:
> >
> > From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
> >
> > The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> > - DSI PHY/DSI base address have some changes.
> > - DPU 13.0:
> >   - SSPP layout has a great change.
> >   - interrupt INTF layout has some changes.
> >
> > This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> > in addition to the driver changes.
> >
> > We have already tested the display functionality using the Kaanapali-mtp
> > device on the Kaanapali branch of kernel-qcom repository.
> > Test command: "modetest -r -v"
> > kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> >
> > [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
> > compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/
> >
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - fix qcom,kaanapali-mdss.yaml compile error
> > - reorganize SSPP patch order
> > - fix Dmitry ohter comment
> 
> Which 'comment'? Please be specific in the changelog.
fix SSPP space issue.
fix MDSS UBWC issue.
fix commit msg kaanapali -> Kaanapali.
clean refactor SSPP patch and SSPP V13 patch.

will be careful later.

Thanks,
Yuanjie

> > - rebase on top of msm-next
> > - Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/
> >
> > Changes in v3:
> > - split SSPP refactor patch
> > - add devicetree email list
> > - fix Dmitry comment
> > - rebase on top of msm-next
> > - Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/
> >
> > Changes in v2:
> > - Drop panel patch
> > - adjust patch order (bindings then drivers)
> > - add dpu_hw_ssppv13.c to complete kaanapali SSPP function
> > - fix bindings example dts compile error
> > - fix other comment
> > - rebase on top of msm-next
> > - Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/
> >
> > ---
> > Yuanjie Yang (11):
> >   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
> >   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
> >   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
> >   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
> >   drm/msm/mdss: Add support for Kaanapali
> >   drm/msm/dsi/phy: Add support for Kaanapali
> >   drm/msm/dsi: Add support for Kaanapali
> >   drm/msm/dpu: Add interrupt registers for DPU 13.0.0
> >   drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
> >   drm/msm/dpu: Add Kaanapali SSPP sub-block support
> >   drm/msm/dpu: Add support for Kaanapali DPU
> >
> >  .../display/msm/dsi-controller-main.yaml      |   2 +
> >  .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
> >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
> >  .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 123 +++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
> >  drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
> >  22 files changed, 1474 insertions(+), 54 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> >
> >
> > base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry

