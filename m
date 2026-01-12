Return-Path: <linux-arm-msm+bounces-88585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D2D13828
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 16:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E02C3019BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 15:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D1F2D838C;
	Mon, 12 Jan 2026 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDEa4vxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjAaV8jk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6A2E266C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230646; cv=none; b=CZdSvJwWt2LouCY7PsLrbtIbcym2EB3zhe+kEv1TXHU8iqwlJJMnCJx770SC4aSPTDCiJ8kaIsDbuuoqIJa1aauQQ+e/p3soYPE0QQqicjNtMyRlmA2a6JFn44hGaVHWkGfK5Ok7unU2XGYR35REbk6Eym7p/Kf9KpIlXxH05ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230646; c=relaxed/simple;
	bh=j+TXB5m/vF5VDCTbQgIiA0PaQaqBi0gn7fcOA5B26tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTFdpF7EjSk2ulNf78iAHt4E4fY1nEnsAWl05j03LqI80Ob26cmc1d4nOWQA6U3bOk/xQAcOtK1iTWAd8dyebDntmyWQshAyyWLeISW+EIzkGw8z4tMQGuUqXKiLVL30dp7gUPXaW+irp+7f7SaE5cYzhoeOBIKRHJ0PlrN7Sio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDEa4vxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjAaV8jk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CB5GIS2821924
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+TXB5m/vF5VDCTbQgIiA0PaQaqBi0gn7fcOA5B26tc=; b=cDEa4vxSQpmfjHmN
	0sn2ZAzMlMTC+WdDLvFF1OioXN0ReCo8UuxFuU8z6rhbtP3Ut7sGV5pQHp2Q/2g2
	8sSPFsZzahBgiun6y9f3FW6stQcnzyh8Lx00u6XxFQvjtmfjHulZyb0yLPx/MYyr
	qYsyGU6Qh4OECT5EFMn6pFhMDiCtS2GZj0uYZaE2dtdeTjQPMU9eWpVk2fLj1XfN
	yRduUDEQA/AB6xCzg/rXGDYiycBwaGM13AUksOwDmDWhdFH1DsDgoTyIQwRbOVNU
	R5KcHlm1OMVjtrEDzOV+H0nlzj84SqwSvnXrmJw23wl3WqSCV3Z+jqMEA6DRsD/P
	2Iagow==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmysagpn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:10:43 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-792738a717fso23708117b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768230643; x=1768835443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+TXB5m/vF5VDCTbQgIiA0PaQaqBi0gn7fcOA5B26tc=;
        b=CjAaV8jkb42ktVNfYb9PZO46pBUH3+x0+Nd7OvLkf2nMK2c8GjEABHTUCnDYkdzzzD
         O4kTunfhgHZlAIvCwtqn+RzbKEvlKHNQagqcNmehWqLSAP9aCWqwXWBR5sWb7giFrf4v
         k3hlWjmPXyEtEYJx7q56yct1m6Qy58Iz4I+C8I0FZj4uL5K/MRGBA5Ht+4GF07fe5kog
         OlRKJxZLM1Jb13JA82Q9ji9/PIx6+mBHy+gV9YjmVNivHx2yM5fC2001GpzTS5UUKGee
         o5Ck5O+oeIzzdFrVX8hyxFAfPztdJbaivfPvQ8koznJdzVzPIYwrQHvT52IIN3zBWtaY
         Mwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230643; x=1768835443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+TXB5m/vF5VDCTbQgIiA0PaQaqBi0gn7fcOA5B26tc=;
        b=ZL78oxOc+vpBzVYd2jWLbqG9tvo0stBnmaqTLyywxrvnd3jTXLc4gGDO48vLRI8rta
         CSNhRHS/pYYp9GzFkSXgtLS7TyNvDjKPc+o6KME+lQAMOcCJ+qAOj8uw/GEoTolrmsI/
         6Hy0QMWCvOY8JSMzYB1dihSJyxhgYZ/ZkvuJMv8b8neW8waUMBlA2Zi/D1yyG29dMByo
         29fLptCLhNv6xo0s43vPqz25k3OO+2Zu1cBlQMuD3QSSRrnkT+pLpdiswNLFwAJE/jgQ
         x96ZKhdfNi1SU+wfwvaHCnYF8ITJtGrw2dK7Az+ooT4Ly+w0bpQvkLLe48l5761Kiw7r
         GCEA==
X-Forwarded-Encrypted: i=1; AJvYcCV6MmOD8xSJc4HDPB4R8WfYsSJ5g98V1R5qIpQr8JtvfoQ5eWcga+91MwYn1VcwO54ba+yv1AeFfDZF/bgg@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3/zsWP9Z8BY8LSejnkYVPbsCDGq63Hua/MTzgHrJXh8i2RDL
	5pbyDaMHgPi+Im0HWpqot6EArP/sXQbH0Qq1NVVLXCQSic+o0nXw/a3y2l4eJ3uwqF8YV8zjB4x
	qlIAkYBWsd6bTYeB0LwmJQTvX7hs6h6GnuWi+VLeHjyhm6hag1o2i7IMzVJuc93OdGyRKXWDzVI
	AvB5KGla30ymJMUtb66Bp6JkAc4qLjYL/fv853rTEF1Ck=
X-Gm-Gg: AY/fxX6Qo3+Nmovke7MM2GqDJCrxEfQXpoGOkwlefz7m44eCWdCOeF7XXtagDF9izwI
	FKSySeOx+tWeU3w9k/knvd77QrCE+nroqehU1G35XzJum96EPDaNLyiLhVDyvwtZ5IGkNwQ4ehe
	U0GPcqxL1WrFXVJqUg0ifoH8r+MSFl3wjX2btPBMFMJPp0qN/eGlgTYQN4g+BHSdvNw/w=
X-Received: by 2002:a05:690e:130e:b0:63f:b2ca:80e1 with SMTP id 956f58d0204a3-647169b381fmr14415963d50.0.1768230642770;
        Mon, 12 Jan 2026 07:10:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb9k3409ATzMPrfctYBPA6sAFJ6KBcx7duI0v6qPBvcEaLLBBhG+aV5B6vji3+2MGPaLh+cbpyKIKHtQTnMRw=
X-Received: by 2002:a05:690e:130e:b0:63f:b2ca:80e1 with SMTP id
 956f58d0204a3-647169b381fmr14415939d50.0.1768230642248; Mon, 12 Jan 2026
 07:10:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com> <e51e8665-0245-4ea6-8c09-c73004a34a3d@oss.qualcomm.com>
In-Reply-To: <e51e8665-0245-4ea6-8c09-c73004a34a3d@oss.qualcomm.com>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 20:40:30 +0530
X-Gm-Features: AZwV_Qhl0ITcawgfXsQ6J0WuskxVhWHEkGKvw1sIfGJzrIxJtyF1YokdlrpOrks
Message-ID: <CAEiyvpqHerfzRcRRasG7Xxv+5YPzcAEO2rNsbZK1Y081jpwNPg@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add polarity inversion support for SAR2130P
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=auO/yCZV c=1 sm=1 tr=0 ts=69650ef3 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=n3BlUNrEoRwJoBZIV1UA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: Ik5fa0yZ08faP-hg7DF-2hDCFKqouiWm
X-Proofpoint-ORIG-GUID: Ik5fa0yZ08faP-hg7DF-2hDCFKqouiWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEyNCBTYWx0ZWRfXzJsUCE9/Hynx
 CF8WOa9RNko0Yevt7mXx1OyNkO6Ix/PZwL4O9GclpNvvk8iBhJ5fNTyBoCItffCQTnfmCZr7JSp
 X2jQ81U8ZKurxLv7b9xuJACdeMEX41i3JXjytUvV6lsFmLlWfjnkBNBudXUvqKlFekm41yzAkoc
 JAGQ+FlRW4VQ9G8bDqVXnRij6cQD42SKGHqlHQbE5AACEmuiTq7vXUmIGpeSWAyFIZCNID2gdul
 klfSbSunHUtgyLi/+hRpTi/Yr2KZzx7leGzsYjRZmt98tbL8hSBa15L28B+aQ0MfE4NuvD3PHb1
 lDJM5t95Oeq8Ej9+S7ojdAzurFdDC7aIqT0nHUzN9FMrkXVSjtmONesyNwsswUd7L2sDolMMAZN
 +iqoimeLETOPEWlmHdMeQKaQJZLe8oL3bJ/5mmwW2MBttRNW+DdhdX8qTjHPpuC7J1E7P/PyYxl
 lpsIlqNk65szpAPFrCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120124

On Mon, Oct 20, 2025 at 1:24=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/17/25 10:34 PM, Krishna Kurapati wrote:
> > On SAR2130P QXR Platform, the CC Lines are inverted and the lane
> > programming is to be done reverse compared to other targets.
> >
> > As per the HW specifics, Bit-2 of TYPEC_CTRL register indicates
> > port select polarity. This bit is to be set for SAR2130P.
> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
>
> The downstream kernel for this platform corrobates this
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

Hi Vinod,

 Can you help pick this change.

Regards,
Krishna,

