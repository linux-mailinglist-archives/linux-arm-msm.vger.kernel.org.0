Return-Path: <linux-arm-msm+bounces-77777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41CBE8C7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 15:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19E784E27DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 13:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF2334F465;
	Fri, 17 Oct 2025 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlLyrrzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B88134DCEC
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707064; cv=none; b=azc6n3IQklU7foHVxaMyKMl0UiXLkHAPm4RwpCoG7p15oAjMjEzMRtbm6FYOY/aexfjQJ8KTos2Aoih+ltItY4SF+j4lbu7EXVGF4fG5xwUxj1hHZTryGim3yuL09slP2ni07WjhfrodApO1eWv4dokfPQgd8nRI1rDb/xWmZjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707064; c=relaxed/simple;
	bh=bBet7OKcIFo8/SortnaFr6ndbpW4yi8PlghaYES4Z50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjDBuOJ3/QEUFXO14lNovHQoyTvfvTIMDUYqkBCImxTOujs8gSTDxBiYDv7AUjgC85/A3fVNHlyqmmnQNjBsNNq3vK1aMvu2QPudl+6Wu+1tmxSppDSbn2r1LHmPupjlAX/kT7KGfv8Yv+i+XcTWWxLx1Tv1oEjd1KEfMF/dZa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlLyrrzw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8AZws006091
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3LILjlfqEYOLQkEETs/dYDTn
	PSt3uyaP94CFMKgd6Sk=; b=jlLyrrzwtrCiJc+Phc1WGAhn3uCYpQEpV6fp4kmQ
	IgSDmMmz4nwq/hXvFoNCiLhVJQQ2/gHO/M2xmyip868BiXM7Wa5rhetqO2bY2Vkj
	dX77ZmUZpKQ41bKC4YLYVbfYTpsaXiScROwBzLmsR/6VsfoME4Vi4ksSJXoKXxJy
	ywT4AnumPn12zPcWe3TOUBv52zWiNFm1wU2Ir9VyuRG0DN4JPfrX8IckxmsAO/sz
	B5HSU7OvjAiz5JQhl6hIC6B8GYIX2rE6c/o3l4xzvXioX04K4TKxKvn+lfjvxhV6
	VZp5BuiJ3Etwr0MwahRyuBBRJTQVie5h7esPIr9IaejlIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwxmkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:17:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87a0e9be970so66181076d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707061; x=1761311861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LILjlfqEYOLQkEETs/dYDTnPSt3uyaP94CFMKgd6Sk=;
        b=AYi3V74NzHaErMSFRpKswSUIaOabNAW+Qk6HXB+r6JAtlf3sfeH2DXRCvJ4u3Q9Bcs
         z/tk/LQjj3sKb/HwnZ54WuhqSeP4N6MSaZEEFVG2zJ3m4G0dcaUMZMoCFFfweA7OlQS7
         /T7tnBkfTAhyWB77GUD8CjuSD93h+j2gxurX1cFNn+jJefV+mA49SaU1WXUlTFOnqm36
         9fIjMylSuE179UJ6Pa2TWpZqslrHrp6q7iqtc/Ur5fPNHd9Jqj4TWM9DkZBTdIUlT9tA
         mIgq9l/CIWrjj04A04SjRBbH5bXaznm5qa1J6+SXSFX6DPDWY/ucqipvznTYp8IjE++e
         JyqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1FOlnff2dRq/Kj4qY8sISgQrsEO2WQereC02WoB/yzLDEs30rvuDq5DjcwTLFvLI6kSAn2rVDLosh6CKJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+F26GHmBUzfCMCdaVBb+lvFsEe0/2qeNvQLPq4lZRs3vxxLOi
	T6wPtNahhc8Q9PLVIbIuGFfxX0lYvd5lsCAJ6EDfnTbjqAm41gJBJoxq1/7iS9YsQqMUvO8qGJw
	oIjrm8RUnU5Rkw2aR1uSvHBp7Plldeb81LtCMI9NLKTbbt0aNcVXt0LqcSQEZky29kRz4
X-Gm-Gg: ASbGncvWP3JVKPbBDtBqqixkzaGCiUSyZyoJe9dfgnWjBxrIISAiD/Vgh0c2Zb5YZaK
	K6n2sIjnJVPgB3WqpfzAOKgFhMfEnJHLxBQjYYZ4lZ0WgIPbQYROzrFhIAvEyH+KNZ3d70EM4U0
	epwqa8KbTVNrwRGr6Ilv40pUdVntUy+wgZAjxcTc+rs1gSRhoDMirQs0iQyVOm0u6KYgRJZkQu0
	Ou52WbGenNyikzX8g0WpytiGlIvxG75/uN0EQ2asne/ZxeyQ7itrSN6agAoa6/hZATFrs/0I5AN
	UqKnGMnBF88xwNLsJjLND+kiI+3i6RUu81iEhSUKnbPGkEYcJnIWSQG1XcfpoP8mPu2z23Rt6TQ
	JCjR7WL19egRU5kEQSS9UvAXokvCO6z3VnOVzTCkS0sHWCdX20mpPbA1WfmkrZDf4+IuKJGPj8R
	gScHnOkxkJPjA=
X-Received: by 2002:a05:622a:1482:b0:4e6:ebcc:23fb with SMTP id d75a77b69052e-4e89d2b9904mr60570501cf.36.1760707060804;
        Fri, 17 Oct 2025 06:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7v+jw5TyUGE2GPu1mMtX3P0F0LCVH2wPKYMO3Oz7sZ6e30VO+kzOqFROiuxwu8cIa+k2C/g==
X-Received: by 2002:a05:622a:1482:b0:4e6:ebcc:23fb with SMTP id d75a77b69052e-4e89d2b9904mr60569691cf.36.1760707060268;
        Fri, 17 Oct 2025 06:17:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ee2asm60957181fa.50.2025.10.17.06.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:17:39 -0700 (PDT)
Date: Fri, 17 Oct 2025 16:17:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: prasad.kumpatla@oss.qualcomm.com, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] ASoC: dt-bindings: qcom: Add Kaanapali LPASS
 macro codecs
Message-ID: <nvomxjtxisrwb6gnqf2xvzo2sxgwsoquvvdiujrbhvjm7atwgw@g2jpwjusfcz4>
References: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
 <20251015-knp-audio-v2-v3-5-e0e3e4167d87@oss.qualcomm.com>
 <6nyqz5fsqyqgtsqk6xxm4iorzoelhkgnghm5xczh6iamvmdfpa@2vff2lk6sq7e>
 <3d96ff4a-1d3d-4089-b571-b4d28062566a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d96ff4a-1d3d-4089-b571-b4d28062566a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXxIufSn+NOzKv
 GHMxZFTXbG/TBXSL+ziVIA0Mpv6ZHGNpC9IFhpqklZEtf1rN/zdCDr5wzyvm33whL1kjiWIJRb3
 bZqtZrY6loyC2pVjnnPnliNHXVs6RfR++/9FUy7uv4DQeqvVjq+B8KBIvlpuTf42+nT6SbvGIqD
 7S5Bl/O0tIqdR0hseSbecoG2c8SnPxvV7aihkHYp0bdWbYS/8XwVtUTNQ6f4nGDk1S8gh87JyLO
 IlviGzRRGYgFQgKss6HTIOMMCt5YDxJH7tFiebaJmSbU72mSzZdrQP13NLxtXoUE8AmDKzSwu3C
 XctNpJXBEgoqF3hKLCj9aK20kafJ9dhMF9PX7HnaRIVW6hBlgtGBw0p+UmrFBM3ciVNDw6Bbmg2
 IJLLzpRIq3rVGbesc9VwlZ2NEnq9/Q==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f241f6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ugvR7wMMjgv2hvCkpHgA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: k-qR4uxj2qogPuRZmAuulEqxl0ni659V
X-Proofpoint-ORIG-GUID: k-qR4uxj2qogPuRZmAuulEqxl0ni659V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Thu, Oct 16, 2025 at 08:59:29AM +0200, Krzysztof Kozlowski wrote:
> On 16/10/2025 02:54, Dmitry Baryshkov wrote:
> > On Wed, Oct 15, 2025 at 01:27:19PM +0530, Prasad Kumpatla via B4 Relay wrote:
> >> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> >>
> >> Add bindings for Qualcomm Kaanapali (LPASS) RX, TX, VA and WSA
> >> macro codecs, which is likely compatible with earlier SM8550.
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > 
> > What does this serie of SoBs mean?
> 
> To me looks fine (see v1 and v2). Prasad wrote the patch, Jingyi changed
> it and sent. Then Prasad took that changed patch and changed more.
> Perfectly fine.

ok

-- 
With best wishes
Dmitry

