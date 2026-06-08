Return-Path: <linux-arm-msm+bounces-111743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ang0AcJ+JmrVXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:35:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98C6541BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:35:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E6lLaA8q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dcIp1Ups;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111743-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111743-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 808EB304178D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5623AEF23;
	Mon,  8 Jun 2026 08:22:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA93AB5B7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:22:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906963; cv=pass; b=fZAnEc+D4Ke/nm1L/DiMtJnsKXZc1afIi9vV7Ue1HRXQSDlkEiwtO02YN55FPVj4b4JLcmiWDZx5KrjG4IsnIXeaNQoQiW6AWU8s5biPHxjrqodKpclXyZUOuyX2Sh2+Ott4MUVHoWWjvAPCCAs+FZglDiznF1zca4oSbw2Cjvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906963; c=relaxed/simple;
	bh=vtWNS3npdkcAslK/SBBMO1SRfQSABiKbV8HThujbXD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JF1rjI2f8O7qrnGHJ7g20JuBsoeoCNPyy2TpsiGui5ZqhjXl3Ap7nBv8/30ndzjV9iE182gy5nRfisEzyTUe4D1OM9dHV+mCKWyPIVTgahLzu7HnLo5Rd0MqEyDsv8MlUVvfE5M5C0khnvs3zOx8sAnfStiYDFI0i/XZZKxss2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6lLaA8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcIp1Ups; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ora02274543
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=; b=E6lLaA8qN09yGM+s
	c+LUGNc/oB5k0DXe8dZ6ZZsQPGDMTMob4DRZoWJLiZdUObBzjZgJJgQeoL/XVOgm
	OSH6M5XIugSvBr16h3HG6vCUKQGG8DY6Trjf0knwsA+CN8DIxSrVu1eEplln7Mj+
	C56Fu2DvVxiV0A9U5GcQsroffiLpMkXjmY1xD/zAveUgBW+fVu5KX+0OgaAab8gw
	8SR6n69zkCoWI+E3ZZ6IV88maTxranZUJUvTDn0AWSoY4Wi5lLu85j/ijRJWCJKg
	RsIm4M7+yLDQxv/+4fy6Hbm+XPBQPN0WVWKXr6RnVqfOHFrtGaWKrz+8DwpE/zQ3
	/XNh2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxfux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:22:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91574ad6871so384638285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780906958; cv=none;
        d=google.com; s=arc-20240605;
        b=fsqanPRpbu/wxbNtAcn4VRkY6xmXJwRNVt3spYgOpKzMuj1Xf8VwHMky5lNsWJt1Lx
         mgjGj8ZE1TfDXaIEAOhWDmhHY8UXYhFyPGJxIxYrZBMY0ODWUhmkKaDWIAJhBLvSwqmE
         1RQ9DcXdGVBMAlayfaKxALhq0XYiCJ8Y2wXbzv1i61u4MgaTRa7nUw3edt+6FCNzZJll
         BPGaAlGt1IuN3uaQMGTP67oY70+ZUK6YKjiFfvnCEBsK14OhSaJQQC3XKo5o9jXHCxu7
         QKV5uV6AEB2in0kRa5KBad8etFq5f7HOBxHxZ0JAutl+Nz1prX3+KALL7WE4tQLUjB6S
         2+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=;
        fh=vmd0BciGk1rm5LuG+W6hbbeqnPK2hmbF09GuQhPhBjU=;
        b=jfKzzlIDxxlvSc1YYjtE3nhIpiVyOleS8kbgpIxOJBicfCUT/It4ivHHEMws9GpFYa
         iRLyrhY42livKpNPg1H5shkthlESuGY2neeLAE+mAQkO8esr6SCNOrbDg36ba/pTOq27
         rz9k26b9PKgjSoq6eInkib4MRt0DGwWJ42/FOp9+wAk8YuOmrsXzkGLWIxeGCzY3D6GN
         irjp46Y5XlBjFGmMNajzMGoCwWzrgTtoXpRbyrEbM795r1zMRQ6gIp+XNJS0wLSwuF3Y
         SRVLQ9znRv3Ej31z//QT+WmHLflxY1I2L+NHjlt4OBGp4X/R2GfG+Sy6wbfD/BsK8E8L
         3auA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906958; x=1781511758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=;
        b=dcIp1UpsVcwo2HBMwV6XcwuN1/QDxFNzp+kZq8LIS1YNTAAWIiMA/NoM3sfzCJyYXG
         cJOOJumMMHX5nEsY03btyD23HgeYl3tbN7YomVCkwnzeeYi1Pv8fzH6fAdxoUQzs/aVL
         oEfyHj1WfPR7LZVf4QklFzPoiOZ97YwXxQJDl77n4WIuvOyWCQbGlyCwroDTaspfLTQN
         sURLhgNrffLs21I/v1/DnRZhKvhvz4yhJ6VIhwfIZloONlv+Fl1srQB2O8giNjPjHGmM
         muE75yhkfvim/VOWZXMF7OHoNaiux5eBOofswmlXJiinYUZBJZBG6GtY+jKoju71sass
         GT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906958; x=1781511758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=;
        b=bCmITg0k4Aq+JLtyQUqZa5PGQJSwqfuWgmhekeM0hvNimk5Z9U3L9yTN7sXjjVhJAA
         Ai0mW92VAmyGpanEVXO5r0yEecBUCc0G5IZAtDzTta1C66IbWhZI/8U9z2mnXJFSJPjQ
         224RwLnKZ43jgh/PTc65U84qvBhDUkpHKb27Q8SY/IOE3eeT7AcdnUsSWdHAjFIh0voV
         JkH6txz5e4Bw0xU29Etv+XajYtSM6Wf9RFN2husr/OXnB1esbhbl7lMOJU9nmWXetEDy
         CNAYYgpTSkeGnE80aNheu6s45lyfCObt2nRlsfJCNtje4a7US9TLe59p7aBy/hsBh1Bv
         T42Q==
X-Forwarded-Encrypted: i=1; AFNElJ87btbBDfI4d1FPN3bw6XsytRcf3imFO5XctJjigjrtAvO+gbVMiyFgwgXZPqi7sXE4qXe9dpBKMQf1WV/R@vger.kernel.org
X-Gm-Message-State: AOJu0YyuO97/PnbV54OEpJEaAWvk1kzysTFMKD43r6yY7k9x+kQUjAcL
	iUP0nnsJ/RopX9hv85CiFRV9BckzdPOyjYLn3Z4+LIjB+8iU//jTpEIylPBbUb/O4mb5zVe5hDh
	Y1GaZ66sH8rVMJXrTxhYGlvlVnCB8gPZqpID69ZLPT3b9geyFzjLlvSvC1OmoO38S1glykX7Y2g
	l+cV3A9Fb1owJfIkI0MCde2/bSQOwrH7aBlRTbTfWtiDo=
X-Gm-Gg: Acq92OFNWC2AwS5e0pj4hjBgdjQWgUVcX+OJC+nDjKbH2sZWmxSChQsgZnfgR2c0pYT
	EWov4gnAdTlvwj8QDnywB7USMyIlCgUNtgAHG1G1LHM0OdETfiGnjv7/P3FoFOjJPNr6a6dNXrI
	SiGO++4I/d1mA2B5FSO2abHqD8Bxm8CYSEZkka6A+qzG/NZe+CZvlpMp2a5mhn8NON772a46LSa
	vjmwXNGN3iDbOUpeOBnHJP1OedT8a2Rt88mDc4zZ0VN7LypaTP3AwqHwbAkDOh1txQlQzNwr227
	h3hr6E10OPUMUWHEWpsjwZNuiUc1DspuBlTwnAuDmKRpW1Z3Y3t0xOzgt0v/
X-Received: by 2002:a05:620a:f0d:b0:915:931e:5e8c with SMTP id af79cd13be357-915a9c7584dmr2385827085a.7.1780906958033;
        Mon, 08 Jun 2026 01:22:38 -0700 (PDT)
X-Received: by 2002:a05:620a:f0d:b0:915:931e:5e8c with SMTP id
 af79cd13be357-915a9c7584dmr2385823485a.7.1780906957558; Mon, 08 Jun 2026
 01:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
 <CAFEp6-2rT5fXkWaa-Fd--h8zuJ7kQqPyjedGNXrGvco79yMJCg@mail.gmail.com> <2f963239-e1f3-4966-b442-7d44f372ea3d@oss.qualcomm.com>
In-Reply-To: <2f963239-e1f3-4966-b442-7d44f372ea3d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:22:25 +0200
X-Gm-Features: AVVi8CfaqXeEW7_fGzZ87WHqiQ-n3gAVt2qJ12GlDUzulGzVwqZJCRnMLkCi62M
Message-ID: <CAFEp6-0xpsNHn-Dg9LKLvMbnPD6DBo6fi5iEo6DWR8uosVxQfw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a267bcf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=gccCA3bCN5zK5WmTdcQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vDLTSm3ytAWZRi8_yD8gPs_jORTAZxbp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NiBTYWx0ZWRfX87muHAT5CieZ
 PVP/MiseDubajrfN+VkZ+7iX3KkomfEtALeTodcOu+VTh4sZBHv6xlnyLoHUhG0s2icsrSn6bYw
 ZnGa4zp6YMEQTwif/F1qXimFTAFwCHgIeCAAXPZ9na310fO6/CG/NCZMUvLWidVp8uvhY8bY9/5
 Lq5FtT/PKZWnMB0s6XElrWap5LuIiT5ElSKHqU6ye7kPwX+hI+/46XLtfV0DcXPcsYMvoASAIwq
 dRJYFf5gRQJ1bi0X6xnmkYsyDxIURrg6aDnePf0DKqgd7QoVRM+C9Xfocrk7ktkYT7NbwWAVdJP
 SwgNnUdD3c+ZoWHHrisR8qxuo8tf9jx8213y88Co4Kfc34vdvcYb208Jvc78isFRpLHV6SCy8y9
 xyELjt6h4aeTYKFrAOHVBhwu8cUFVt6GapsWwv8A7iEdQ80Kj79J96Pmilga7qtpwlkYCN7QXy8
 6DRwDp0q8qHDobDpb1Q==
X-Proofpoint-ORIG-GUID: vDLTSm3ytAWZRi8_yD8gPs_jORTAZxbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111743-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miaoqing.pan@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:yepuri.siddu@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A98C6541BD

On Mon, Jun 8, 2026 at 4:26=E2=80=AFAM Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
>
>
> On 6/6/2026 8:57 PM, Loic Poulain wrote:
> > On Mon, Jun 1, 2026 at 2:57=E2=80=AFPM Komal Bajaj <komal.bajaj@oss.qua=
lcomm.com> wrote:
> >> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> >> EVK boards using the WCN3988 combo chip.
> >>
> >> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> >> board-specific regulator supplies across CQM, CQS and IQS Shikra
> >> EVK boards.
> >>
> >> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> >> with register space, interrupts, IOMMU configuration and reserved
> >> memory. The node is kept disabled by default and enabled per-board
> >> with the appropriate PMIC supply connections and calibration variant
> >> selection.
> >>
> >> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> >> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> >> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> >> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> >> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++=
++++++
> >>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++=
++++++
> >>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
> >>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++=
++++++++++
> >>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
> >>   5 files changed, 223 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/=
boot/dts/qcom/shikra-cqm-evk.dts
> >> index b112b21b1d79..c2ed0396533a 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> >> @@ -16,11 +16,48 @@ / {
> >>          aliases {
> >>                  mmc0 =3D &sdhc_1;
> >>                  serial0 =3D &uart0;
> >> +               serial1 =3D &uart8;
> >>          };
> >>
> >>          chosen {
> >>                  stdout-path =3D "serial0:115200n8";
> >>          };
> >> +
> >> +       wcn3988-pmu {
> >> +               compatible =3D "qcom,wcn3988-pmu";
> >> +
> >> +               pinctrl-0 =3D <&sw_ctrl_default>;
> >> +               pinctrl-names =3D "default";
> >> +
> >> +               vddio-supply =3D <&pm4125_l7>;
> >> +               vddxo-supply =3D <&pm4125_l13>;
> >> +               vddrf-supply =3D <&pm4125_l10>;
> >> +               vddch0-supply =3D <&pm4125_l22>;
> >> +
> >> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >> +
> >> +               regulators {
> >> +                       vreg_pmu_io: ldo0 {
> >> +                               regulator-name =3D "vreg_pmu_io";
> >> +                       };
> >> +
> >> +                       vreg_pmu_xo: ldo1 {
> >> +                               regulator-name =3D "vreg_pmu_xo";
> >> +                       };
> >> +
> >> +                       vreg_pmu_rf: ldo2 {
> >> +                               regulator-name =3D "vreg_pmu_rf";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch0: ldo3 {
> >> +                               regulator-name =3D "vreg_pmu_ch0";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch1: ldo4 {
> >> +                               regulator-name =3D "vreg_pmu_ch1";
> >> +                       };
> >> +               };
> >> +       };
> >>   };
> >>
> >>   &remoteproc_cdsp {
> >> @@ -57,3 +94,25 @@ &sdhc_1 {
> >>
> >>          status =3D "okay";
> >>   };
> >> +
> >> +&uart8 {
> >> +       status =3D "okay";
> >> +
> >> +       bluetooth {
> >> +               vddio-supply =3D <&vreg_pmu_io>;
> >> +               vddxo-supply =3D <&vreg_pmu_xo>;
> >> +               vddrf-supply =3D <&vreg_pmu_rf>;
> >> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> >> +       };
> >> +};
> >> +
> >> +&wifi {
> >> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> >> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> >> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> >> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> >> +       qcom,calibration-variant =3D "Shikra_EVK";
> >> +       firmware-name =3D "cq2390";
> >> +
> >> +       status =3D "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/=
boot/dts/qcom/shikra-cqs-evk.dts
> >> index e62ba5aef71f..3bfd0050064f 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> >> @@ -16,11 +16,48 @@ / {
> >>          aliases {
> >>                  mmc0 =3D &sdhc_1;
> >>                  serial0 =3D &uart0;
> >> +               serial1 =3D &uart8;
> >>          };
> >>
> >>          chosen {
> >>                  stdout-path =3D "serial0:115200n8";
> >>          };
> >> +
> >> +       wcn3988-pmu {
> >> +               compatible =3D "qcom,wcn3988-pmu";
> >> +
> >> +               pinctrl-0 =3D <&sw_ctrl_default>;
> >> +               pinctrl-names =3D "default";
> >> +
> >> +               vddio-supply =3D <&pm4125_l7>;
> >> +               vddxo-supply =3D <&pm4125_l13>;
> >> +               vddrf-supply =3D <&pm4125_l10>;
> >> +               vddch0-supply =3D <&pm4125_l22>;
> >> +
> >> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >> +
> >> +               regulators {
> >> +                       vreg_pmu_io: ldo0 {
> >> +                               regulator-name =3D "vreg_pmu_io";
> >> +                       };
> >> +
> >> +                       vreg_pmu_xo: ldo1 {
> >> +                               regulator-name =3D "vreg_pmu_xo";
> >> +                       };
> >> +
> >> +                       vreg_pmu_rf: ldo2 {
> >> +                               regulator-name =3D "vreg_pmu_rf";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch0: ldo3 {
> >> +                               regulator-name =3D "vreg_pmu_ch0";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch1: ldo4 {
> >> +                               regulator-name =3D "vreg_pmu_ch1";
> >> +                       };
> >> +               };
> >> +       };
> >>   };
> >>
> >>   &remoteproc_cdsp {
> >> @@ -57,3 +94,25 @@ &sdhc_1 {
> >>
> >>          status =3D "okay";
> >>   };
> >> +
> >> +&uart8 {
> >> +       status =3D "okay";
> >> +
> >> +       bluetooth {
> >> +               vddio-supply =3D <&vreg_pmu_io>;
> >> +               vddxo-supply =3D <&vreg_pmu_xo>;
> >> +               vddrf-supply =3D <&vreg_pmu_rf>;
> >> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> >> +       };
> >> +};
> >> +
> >> +&wifi {
> >> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> >> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> >> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> >> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> >> +       qcom,calibration-variant =3D "Shikra_EVK";
> >> +       firmware-name =3D "cq2390";
> >> +
> >> +       status =3D "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boo=
t/dts/qcom/shikra-evk.dtsi
> >> index 8b03d4eafa6d..a79f44aff968 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> >> @@ -8,7 +8,22 @@ &qupv3_0 {
> >>          status =3D "okay";
> >>   };
> >>
> >> +&tlmm {
> >> +       sw_ctrl_default: sw-ctrl-default-state {
> >> +               pins =3D "gpio88";
> >> +               function =3D "gpio";
> >> +               bias-pull-down;
> >> +       };
> >> +};
> >> +
> >>   &uart0 {
> >>          status =3D "okay";
> >>   };
> >>
> >> +&uart8 {
> >> +       bluetooth {
> >> +               compatible =3D "qcom,wcn3988-bt";
> >> +               max-speed =3D <3200000>;
> >> +       };
> >> +};
> >> +
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/=
boot/dts/qcom/shikra-iqs-evk.dts
> >> index 727809430fd1..95bd797d009d 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> >> @@ -16,11 +16,56 @@ / {
> >>          aliases {
> >>                  mmc0 =3D &sdhc_1;
> >>                  serial0 =3D &uart0;
> >> +               serial1 =3D &uart8;
> >>          };
> >>
> >>          chosen {
> >>                  stdout-path =3D "serial0:115200n8";
> >>          };
> >> +
> >> +       vreg_wcn_3p3: regulator-wcn-3p3 {
> >> +               compatible =3D "regulator-fixed";
> >> +               regulator-name =3D "wcn_3p3";
> >> +               regulator-min-microvolt =3D <3300000>;
> >> +               regulator-max-microvolt =3D <3300000>;
> >> +               regulator-always-on;
> >> +       };
> >> +
> >> +       wcn3988-pmu {
> >> +               compatible =3D "qcom,wcn3988-pmu";
> >> +
> >> +               pinctrl-0 =3D <&sw_ctrl_default>;
> >> +               pinctrl-names =3D "default";
> >> +
> >> +               vddio-supply =3D <&pm8150_s4>;
> >> +               vddxo-supply =3D <&pm8150_l12>;
> >> +               vddrf-supply =3D <&pm8150_l8>;
> >> +               vddch0-supply =3D <&vreg_wcn_3p3>;
> >> +
> >> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >> +
> >> +               regulators {
> >> +                       vreg_pmu_io: ldo0 {
> >> +                               regulator-name =3D "vreg_pmu_io";
> >> +                       };
> >> +
> >> +                       vreg_pmu_xo: ldo1 {
> >> +                               regulator-name =3D "vreg_pmu_xo";
> >> +                       };
> >> +
> >> +                       vreg_pmu_rf: ldo2 {
> >> +                               regulator-name =3D "vreg_pmu_rf";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch0: ldo3 {
> >> +                               regulator-name =3D "vreg_pmu_ch0";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch1: ldo4 {
> >> +                               regulator-name =3D "vreg_pmu_ch1";
> >> +                       };
> >> +               };
> >> +       };
> >>   };
> >>
> >>   &remoteproc_cdsp {
> >> @@ -57,3 +102,25 @@ &sdhc_1 {
> >>
> >>          status =3D "okay";
> >>   };
> >> +
> >> +&uart8 {
> >> +       status =3D "okay";
> >> +
> >> +       bluetooth {
> >> +               vddio-supply =3D <&vreg_pmu_io>;
> >> +               vddxo-supply =3D <&vreg_pmu_xo>;
> >> +               vddrf-supply =3D <&vreg_pmu_rf>;
> >> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> >> +       };
> >> +};
> >> +
> >> +&wifi {
> >> +       vdd-0.8-cx-mx-supply =3D <&pm8150_s4>;
> >> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> >> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> >> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> >> +       qcom,calibration-variant =3D "Shikra_EVK";
> >> +       firmware-name =3D "cq2390";
> > Does the firmware differ from the one used on Agatti (QCM2290)?
> Yes, WCN3950 vs WCN3980.

It's not exactly my question, Agatti also supports both (e.g. WCN3988
is integrated to UNO-Q).

Regards,
Loic

