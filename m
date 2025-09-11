Return-Path: <linux-arm-msm+bounces-73097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E11BB52F04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2815567EE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 10:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2832A310631;
	Thu, 11 Sep 2025 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkGXXzC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971530F54A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588253; cv=none; b=TIdNOkJVzipdMkWqbeBJ7wOoyjeIgXx4Y2BTF+wn+1v47MJTkpWjucxs+pXCko5mRkBDwo1C8sQhfZVMXK3QXDNgM3ZRCt8i30VEZyuRrBL+vcfjttURivZvHVQL/4+/E6OSdsJferlIgBCDZdaQNjM4LsRynMTv9M85a++YDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588253; c=relaxed/simple;
	bh=w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgWcWAp0lPSNetUa3RNSOB7ohqrMCta6dcVEjt1PMfWAEgpxfiF9goKMEIagoLn+/JcqStxWIYMhnqPeyxefNqFGOeuF4QkP1C3TqJlH7tYvo56Ugzz8RykG7oUwJuTfzYidzS7XvkQglCf4YWpxuuW93uGgE+KPoU189O1Ttz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkGXXzC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IVgA025757
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 10:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=; b=bkGXXzC7osxLiUED
	rB7nmC2VILhkx5rMILzT06IFeDLGM8styZehSnsAEhQ0urhJRLxKP2a+dEyYfdKc
	oVrVKpQgGD+GI7ckTMLUlDNCnN33bjnuL50qmHkFyohR0gnJabd1q+3dvePDaSGS
	CslxrWLJWb/yYwtyhmmyxW23RCTvlADxoikmfvTMrLxt++ZdmKGiR6dlBhGsO3Io
	i1OYxuo45I6A3hAWOwuZ3BeaNi2E2FIblLnaGo2SctKE557YQiAIQG0nAW6+jiJi
	NPFlnPisTYU1Sej6jGNq5wmGpCubSS+8Pw/LBDVg00ZXIMmBBHgaiztikwG2fhkR
	hpAt+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0y8rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 10:57:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2490768ee5fso5032985ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588249; x=1758193049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=;
        b=IGvDRkgZH3Aap82p00wvXGHaYiVZwlkq/qCXPrn8tAuzOBa4jlmf+ZxskAOpPI4d8j
         B3HuU6KtgtSVt2uoAUYPaCV8NmIcLtG1tGJuH89gi7o7mWwf0yKR2sKRpp+05bkmAmwI
         PmgSi0LP9DQICBkaM/tDhbhfWXBF9vxLotzhz0J9GK7k7W3ZKOoShmZLeQ3moX7QM6G4
         oK+492RlEqxPt2d3A2FyqgKciE7anssS53vbSNiUpX6x/OVdioNeUoFGULhCnpFVZ28u
         /g9AibU2U4Nx0NZDhNjmY2EBfi8P5bTpPYJWI2MNUHgj6RS0fq3uCaQaGCjxGY7KLsjs
         DftQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWEgIbLxCG8V9X9/N7o4WN+zql4Q+9+6VMCvi7i8oC5/VstnNjfC8ugpuSInMtv7VoXkl/synWL8Nq8Vfz@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUmb4sq7VjvcHmwXrHr70FWdH4eYY3ApKdl9polINUBN5BsSz
	dis0Urkljt6Fi0prwy6P2OJ2tDN7DvhxeXZ9ptjiH4y26kTrpb+aVCGOGYaHq3kx3xD+n3+cloq
	vi5IqF+8e4QBFUDyRv0n3a4ju0uU/dcuRuM0IK5xoW2jhjLva8YYC8u50KcamvgUn2qCYQB2aTi
	ztdvl/JPDzIuNgoJ6k/yq4/h+6wPNRQSgms3Tpd1o2tLU=
X-Gm-Gg: ASbGncsxUVJ/2+eEi2+XAaq+vK3mQnv0NwE6EmARXWMCPXvVBixgY1pIwuyWVbFJcBM
	xwMMcNvRHq7D924sUDmsPhbf02rXgWFf13D3HO6DGH8dlunC+Q4k/Fs3b7aBlsTI+sHS0j/j9WG
	NK4D3ZYInPCjxbzGdE9GXNU5LLFPdlEtqQ2o0=
X-Received: by 2002:a17:902:f606:b0:25c:8005:3efb with SMTP id d9443c01a7336-25c800540b9mr9214965ad.54.1757588248922;
        Thu, 11 Sep 2025 03:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAH11JD2Q0IWOglR3V4QiPu9OVEC1C5tZSFPqr+NcxPJGuPbUCJ+dsuSyVMVCW06uEy6k6eSWe+gjk2lD+b2U=
X-Received: by 2002:a17:902:f606:b0:25c:8005:3efb with SMTP id
 d9443c01a7336-25c800540b9mr9214575ad.54.1757588248467; Thu, 11 Sep 2025
 03:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com> <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
In-Reply-To: <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 13:57:17 +0300
X-Gm-Features: AS18NWDL5Sq7WXLmyGnLpCSE5BXnWmdKo1qJbjlndUcI-PeO2ah0x-l-T_QEjBQ
Message-ID: <CAO9ioeWLrYAFG2cN6w0uOqQE7K83EAyN7om6+QEPUWRZoZ3-Nw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>, quic_nihalkum@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: eGnrEo0NeGKzP2uX0DRyn3Zk5DxFKla3
X-Proofpoint-GUID: eGnrEo0NeGKzP2uX0DRyn3Zk5DxFKla3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX5lZ7xxm+YSYZ
 0vDpk/pVWFhETLIcRjTFYZH6Jyr18HyPcLX8vDEGBiNz0PF7/UKxLfp5jK5ODl6TxlBDaUMpMdR
 h6TWPsKzgYw3xbgrvaLSUT1w3Qg310qa9f8AhFhH/NzVq99Sv1X6TlAgucQjIVkkUWVvX5zcNGQ
 cNDO35c3HE5BLK9ZrU25Lv055mZQjM/R2oTZqgIHp3MyXGFPMxi7AlKh5R4hFBDXn6ipKcZjUSN
 YiIMLcES1SZN20iCQzNolL88RVkU+pqEZ8i6ngPaYe+F+4JZu7eTUTZZZktxWvpaVJzs2ChJ4Gm
 p76NjYxRVCzVH6txIN8iMEP7qKKFc6tcqMOSjCyn3aiPwQ4pqGcMLK3YISlVMgHobJT9aRQ9e0x
 dEXT49QE
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2ab1a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=COk6AnOGAAAA:8 a=OL7WMRyR3eFSKxD7jRQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Wed, 10 Sept 2025 at 10:03, Vikram Sharma <quic_vikramsa@quicinc.com> wr=
ote:
>
> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>
> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>
> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> Camera reset is controlled through an I2C expander,
> and power supply is managed via tlmm GPIO74.
>
> Why is done as an overlay? Is it a seprate mezzanine?
>
> It=E2=80=99s not a separate mezzanine; monaco-evk does not come with an a=
ttached camera sensor by default.
> The overlay simply reflects an optional camera sensor attachment (e.g., I=
MX577 on CSIPHY1)
> That is why camera sensor is configured in monaco-evk-camera.dtso instead=
 of modifying the base monaco-evk.dts.
> Please suggest and alternative approach if you feel this is not correct

Okay, I found this email. Please fix your email client settings and
never send HTML emails to kernel-related mailing lists.

--=20
With best wishes
Dmitry

