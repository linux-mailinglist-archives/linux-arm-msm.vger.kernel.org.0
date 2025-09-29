Return-Path: <linux-arm-msm+bounces-75486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE482BA876F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 10:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700FB189D116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEA227FB2B;
	Mon, 29 Sep 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cD0sNuFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A2027E043
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136037; cv=none; b=UmfYVow638NfL7dbPInxOROsq4T8C2dDr9geo0l8Rv4xRYZF3qScRQ5QMsqPYE1QGgNKBYYmBt8sSfQNXdjyhhF8gqZd9ky5ycjtXjtFq9qbasa0LtQHrxPHHRyd499OLHk0X6j5PLWCTLrvR24Dm7XiJgVE67bkgs0gpTYoKIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136037; c=relaxed/simple;
	bh=R7BdmZgGTbdZfx8EcUuOrDncdMcGmRVH+JIXn1G/oLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pc6UZoLmACvpeus04e9GimhE2c60s5v7A8dgQfvpZ8ie0W7I84mMdtx40MNHqOHnUlxyPwGBmGX2x19OzDcOuo+sxG4DjuTUAJBLVFFXlX7rum3fg1BrMKWi9XbNM0qTFlkiTLniL2bJP1j+pYXR+nXkKxxBkdbImG3epPcO2fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cD0sNuFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNgAs5023427
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 08:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7BdmZgGTbdZfx8EcUuOrDncdMcGmRVH+JIXn1G/oLY=; b=cD0sNuFVC2Q5FHs9
	BMnBlwSDxTWRi9aCZfSzPKvDpgCeHs49SO1uh86bOF8hVGPzPVd3vHWERnMGVrtj
	TsTbpFeENNbE9ZECfBhRbrQ3mAytjl9446q5uW5dXACcgFVfRg7ZX7+s5+IDEIQi
	9OX68idSS9P7chbxX2TooLkGPpAFsBgJt42lKD7MWiVEIYU4mKFrDiTK5xOqMEmG
	T76GK9OcN/S76OM+s2s8f25b2rqrQheTPntzl6+0bKf/Ka66M5bNacHcb/bIhE7R
	S1lqBMDlbeZRLe9sK9j7SdFEWIfufXU709SwpPZirJHo2EytxlIB8FLrHRtgyKT0
	RgBZkQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdcb9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 08:53:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-797ab35807eso112259866d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 01:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136034; x=1759740834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7BdmZgGTbdZfx8EcUuOrDncdMcGmRVH+JIXn1G/oLY=;
        b=TfJRDowtU0PzteKJ+c1z1ySh5d3NfsrLHLLtLoSigwWTfZWDO4QTu31p0PMsfVPpqW
         7JEuIlGk13t+x9kYaj47fQZOGTtwd4KVvZG0XcWOX6ELlkgs5BwniTjNs1OWxQLAh1Ao
         f96GgYg69R4QM9G+FvQSMdO/UiFcdFFX30hngtnef5qF3Nd3aW3btF7Noc4V/Sc/cqe2
         sgpp0k5Mfa/qwQWtGD7liGy+Uh18jscMRKMqAh1J6fZFVozORyB8La9Guk9UZF4r2p4o
         T9QjzT7Qw/g9kzctVR7XozqMpizvJvGCLQh3AbcqywK671Q+qqZPeAdn1JiSeTX/3+CS
         hhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQHaOSWqOQYjCoxpvcCOoRzWUs3PYz0XfFL4gGpi0nepnBc5DFpEzjhqfRbewN3CM4eqvot2XBv5HHlHK8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+JnnNbRj+nemrxPELtX7f+8RXGG89KDSfk5i5bFEJZ52EXoU
	fcosswbxo1oxppybG9JmTZSV/EivdSH3oUOZHXogs123y8wGHkxNAwj+2s/Q3Gu/z/3xLI+iDBw
	fJkE19mx/L8WB5RSDSOOMz7qYwSsbhKO4wvBmAoTh+xzUO01109sr3eWw4bDhTYh3V3XtkNZfDe
	4QChRJOq9dGcat55wMvCHyEAspBsTBnPsnYN4bUXVlDlyljcKBWCnDMA==
X-Gm-Gg: ASbGncvRgZL3ib49pMaO/qI+O448KsBQ5MZ3FLE4N1OYGDNIhRWbXgV65uS1Blt1/s+
	1i+d1cvAiGslMCa2fnUEw9TVDGSkn1vQR7u+G/myMh/BJMcv7MOCpwaX/sRFnlPDKEYDMPEhPXT
	A2S00wnI26Qtn+hKco5dYWBXmyU3+8K8mAEXLExUNDS51eJHCWQI93474=
X-Received: by 2002:a05:6214:411:b0:7d0:341f:148a with SMTP id 6a1803df08f44-7fc3aa707a8mr169288996d6.33.1759136033911;
        Mon, 29 Sep 2025 01:53:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE7+++gueAWVbcIWzNugbC5NemFua/qTKa7w8VJdZEmfCrc0HAv3aQj1V7qkKv/arj7Jri3xWs8memUSFsccU=
X-Received: by 2002:a05:6214:411:b0:7d0:341f:148a with SMTP id
 6a1803df08f44-7fc3aa707a8mr169288896d6.33.1759136033411; Mon, 29 Sep 2025
 01:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-2-loic.poulain@oss.qualcomm.com> <0bfc50c3-2df7-4e7c-a6b7-99b8e56a65ea@linaro.org>
In-Reply-To: <0bfc50c3-2df7-4e7c-a6b7-99b8e56a65ea@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 10:53:42 +0200
X-Gm-Features: AS18NWDWFNifGO0pEvmy4HvdAyPW7WJ3Wi0YNtbMTnTSHZCFCSZ5-ItZzCp9W10
Message-ID: <CAFEp6-0nja15oSEhm=ZjJb1g2MgM8Vv+fPdDgyghFNestf_t4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8zvAXSFsyge7hQ7LBAqTRL__lP86ICKS
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68da4923 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=y2W2zGIOAgzQDGN_av8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8zvAXSFsyge7hQ7LBAqTRL__lP86ICKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXzNtZpLscEt0O
 DxVmtmCiT6qcJ+ITk0JR4EnoyMGPg6pk5GCi2gu0XVA1/UgkW+lx5xFDUba5qoGmpUxixzqUBZc
 x4fMfsBZUD84ObSSN2yonHpD4KipEuD4QrdetAwdcJHptQXpdkHctV3I4Oh9hmJL9gl6qQMTNE2
 4lqouRIgRzCLbaoGRpCy4wPQHFd8+DbLoxJDI82x2ff+VxPA93gJNBKfFN7LKX33yIp5aioZITz
 EhSwFoZd/yGunETc2URgkZPTc1fIA4PcjnIhGXeXwHajfHwDXRJVPkD2oiqOUDgOlZ9q88gAkOs
 eTPggxGd4gvMWKDA4LvbC4Sos4fB1giH3zXqZhXKIwReJXyfk99sDxx/oxGINlqMGOHmAnggZn8
 QD95fzeCV3D/896YKH7fNGWrKvxP6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Mon, Sep 29, 2025 at 10:46=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 9/26/25 10:34, Loic Poulain wrote:
> > Ensure reset state is low in the power-on state and high in the
> > power-off state (assert reset). Note that the polarity is abstracted
> > by the GPIO subsystem, so the logic level reflects the intended reset
> > behavior.
> >
> > This breaks backward compatibility for any downstream dts using the
> > wrong polarity.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>
> I kindly ask you to specify the intended behaviour in the documentation
> Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml

Sure, I will add this in V3.

Thanks,
Loic

