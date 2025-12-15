Return-Path: <linux-arm-msm+bounces-85222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7FECBD587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 11:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCF8C300E784
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 10:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008D9329E4C;
	Mon, 15 Dec 2025 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gl1K13a8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iG7jRi2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445230DD01
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765794006; cv=none; b=gl0hgSHzcO5u2/JAQc5Tfsnh8GtGxhg5H8sZv3pCi72vKR17GKMlqI5TPhaTe/jXUwZKQQSg2M/OrW5e8BL+nMrq6MWPT6ulxnlbJcVq5CUyi1RpN5iFbtiON3HjOLn+z6xcRUBAkxOwAgf5agG99q9WLl0wdV11LEJapLxhux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765794006; c=relaxed/simple;
	bh=jID5Pz1lOsMNr/jj6hGmzihO+1/O/EeDCusP1DKWUKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XU1dV7ttnZ9DVeJZ+nT1g4NJqWWvDB2Op6V8CY71X7oWTrZwt+sB9hKz+8iEF0fTXdIY3W1rguKdrfN0yyUHNSdC/Yl07lLZvKmvOXVsla7wQF0lszdtMLHwHZIMvHYHvLN3m6SafvcNp7PbQo2Lp3hwugY9kgbMBjlkutGg1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gl1K13a8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG7jRi2m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFACbbg562265
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 10:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jID5Pz1lOsMNr/jj6hGmzihO+1/O/EeDCusP1DKWUKg=; b=gl1K13a8g/HDUY4K
	9hrqu87WbCt92TW2tLc+66uDeKjoNSBJ/w+svmUUeKHj4V41A/38IU/72N1xC8E+
	XuOzbcV8YpLmdduhmFuiK/RpxB0Briih6TCzZTaxWuz6IG5gh6xb7j2FKfn+CYC9
	p/Bmb0SS3a0jeoC8QP9AvVp2+pgb+ecOhz8ErNtmMzcCky1jr0d5urnyHczqYnMa
	WhksO0PJFfYKiaHM/9CqcCqogZdxK1BccId1TMDsDyPANOpSvS8EhCI7pbikRxke
	v1SQkNTbVFGBbz9xN3BGbiHvNbjAeghcr2QlS0QDnBIpo3AnsGkf1QsQKEx1RPN+
	6E2A/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11dsc415-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 10:20:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso66492201cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 02:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765794003; x=1766398803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jID5Pz1lOsMNr/jj6hGmzihO+1/O/EeDCusP1DKWUKg=;
        b=iG7jRi2mRSzgaRzb2AJangMDVBLAkCjP6cd3u/lREB62TU5yYnPAkxGmIWPMmUWUdA
         vIpoF1+ID8LmCz3WDlN7DEAs2yLhNQPxNjrbx5qdnVieXtKhnUTAy4u/XgjicXcqS6nt
         cHBXfbMve6qG37NNwNjP95CyL1Uj0qjLLw8fABIwNhi8s+n8+D9RlwGru9DAbyWKLm8R
         SR31+8KrsiwIgUFMGFrW3GjeGScvpee8iXeDmgpW8D8GYmr74LVbI3rgTnDchnHZBJ16
         c0q8CH+j5KekSsNRcpaExw1zFG7PodViAneFLIaZmyDN6r0XkWGbA3ESzEGyEiZP7Fcm
         ozmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794003; x=1766398803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jID5Pz1lOsMNr/jj6hGmzihO+1/O/EeDCusP1DKWUKg=;
        b=TeHeBtMs7NYHuFNPf1mVJHHmfq4zZoividWbLPSZxX8w5l9rzy2/b8MnZXMrLyP3g+
         NOmr9BGQxqQOxbVMcmmcQvXXQprdusIz36vJNwsmWEMItDzf1JeJf3eYM3VIjYmZ5OBM
         KTd774npEe7YhGWvEj+fFJ74SVR96c4mJpY24Ly8HemDTgX2RbBk1fG/urrQ41IcfIbp
         Anb/emjiYan4EdbdDO9gvyDs/J9lDHralaxoDvyqlA1SVEeIBIxQsZ96uZZNNCVlQgny
         yLRHlZ+cP/Efviful03Ptz9BlYfqtWNTs/69yF1skgjQzqdCE52hAl3iXl88Oeur6TVS
         BEJA==
X-Forwarded-Encrypted: i=1; AJvYcCU/IsUIuywOjk/mXYWn55I8tz8LdYaPhiCsp53BgzJUnXdbnovUZedz8bknevsvYVQtg5Tr516zJQgTNSm1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zNq1222DvNRi/lFjQP4h+VZTjU1H8YZAnBxyyzEwnOmycjaz
	sI7ALL2Sy7i7vd6BXUN32UNa7b2OUcWROchKhbDEdhk7ncD0u3M8cRv0IgVgV4Bmt/XIvKFGmR+
	vfv2X1mmlyDVXqSpY4ic13fihe7++/PnL0sCjtcnhDpQZyEsRau1C5uALLnRb1wMT1scPDwkPDL
	i/bZiPTBaeSrmsW5Oac1xxh1PNXFVJnFBXNNZnpPPndYk=
X-Gm-Gg: AY/fxX7krULG7EVgdxlc5ZUvxb2DmgzMxXRhZ0gJ8zxtRcZN3dY3bX/hhjo9TFdDh5e
	QcknSVmHaSTqOIjs08Alq6ZveD/QSLxoRtsd0fqbti4XrGUl/tLURKCwk8o2uEdK7UtD4hEYtxK
	njudI55lmKv9zkYIDnngGdjaH1cHElePNb2r2CK/dm9iTHUuqteXFucrocfeioZO7pczcBSMZM1
	g15VhxMtZ9m7qTWWYzhgCy/k04=
X-Received: by 2002:ac8:5fd0:0:b0:4ee:4656:54e8 with SMTP id d75a77b69052e-4f1bfc3630emr186117031cf.26.1765794003428;
        Mon, 15 Dec 2025 02:20:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8mhGrBkSzNkF4DzliVe9C5Ih47UYoftQT1OIJpUJ0UK/dVB428Rb7JSrvxDavz+aDwBYcQC7+v0amRRk6wPo=
X-Received: by 2002:ac8:5fd0:0:b0:4ee:4656:54e8 with SMTP id
 d75a77b69052e-4f1bfc3630emr186116751cf.26.1765794002970; Mon, 15 Dec 2025
 02:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com> <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com> <aT_Xc6LR161QBRFp@kekkonen.localdomain>
In-Reply-To: <aT_Xc6LR161QBRFp@kekkonen.localdomain>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 11:19:51 +0100
X-Gm-Features: AQt7F2qdW4Ea6_Bf65KtP4LW034t4fYmN6BR8N3RGUwgap-ZkP7eo7ApOSFvSKM
Message-ID: <CAFEp6-2PP0ufge0RXTrE2Nrn_sLCN5erokxpJsuGeHq7ZEZ83g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Sakari Ailus <sakari.ailus@linux.intel.com>, krzk+dt@kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, robh@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 73Ms2iI1b4CkCNkUdV64f3RlwPTvJl5J
X-Proofpoint-ORIG-GUID: 73Ms2iI1b4CkCNkUdV64f3RlwPTvJl5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA4NiBTYWx0ZWRfXwgjofrYUavhZ
 Ku6uUA5J8ytATpF+JHMZ9YV57d570hDruGo9bH36dU4I30pZ7Eb3untyWfy8e+craT94HohF/4b
 SPYMKtqBpZL5Wjyt5VX/KbPx0aP2bXbdupL3TixA6k8pGnT8crEo4i+9HKZGPaULVj277+7onaP
 pRj1BwUY26y6isOB+LWfR2/gXM1F4XHn3Uu9zogPCfRBjADK/ijnX+xn06qYOZY10rtJVOMZnz9
 dBcnyEr4GV3KQsNkccjinylFWnhgD97oHL7vs+h8Jc6lDK8pvZFE650SHvyljEuARVAub07cUBo
 urQe156h2a/R6HG09PpuCS26+Ch2YhcE1dumCVxwWk/F4lxit4OV2BHgJbLWxXB57lib7yuxLY2
 F3LJLdQumyIOQEDuhKdNlffC06bbcw==
X-Authority-Analysis: v=2.4 cv=cfLfb3DM c=1 sm=1 tr=0 ts=693fe0d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8
 a=LUmOBNcdo5ogea7qYVEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150086

On Mon, Dec 15, 2025 at 10:40=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Loic,
>
> On Mon, Dec 15, 2025 at 10:35:15AM +0100, Loic Poulain wrote:
> > Hi Sakari,
> >
> > On Mon, Nov 17, 2025 at 6:30=E2=80=AFPM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Loic,
> > >
> > > On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> > > > Ensure reset state is low in the power-on state and high in the
> > > > power-off state (assert reset). Note that the polarity is abstracte=
d
> > > > by the GPIO subsystem, so the logic level reflects the intended res=
et
> > > > behavior.
> > >
> > > That's an interesting approach to fix DTS gone systematically wrong.
> > >
> > > I was thinking of the drivers that have this issue, too, but I would =
have
> > > introduced a new GPIO under a different name (many sensors use "enabl=
e",
> > > too). Any thoughts?
> >
> > Apologies for missing your point earlier. We can=E2=80=99t really name =
it
> > enable, as it performs the opposite function and that would be
> > confusing in the device tree description. A property like reset2 would
> > be more accurate, but I suspect such a binding wouldn=E2=80=99t be acce=
ptable
> > from a device tree/bindings perspective.
>
> Many sensor datasheets document a pin called "xshutdown" or alike. That's
> not exactly "reset" or "enable" but it can be mapped to either and this c=
an
> be seen in the existing bindings. The polarity is effectively the opposit=
e,
> yes, but does that matter?

I assume naming a pin 'xshutdown' or 'xreset' indicates that its
polarity is inverted at the driver level, the driver interprets the
shutdown or reset function as being active when the logical level is 0
(low), as they actually incorrectly do for the 'reset' gpio.

From the driver=E2=80=99s perspective, this naming convention is acceptable=
;
however, it causes the devicetree description to slightly diverge from
the datasheet and leaves the reset property effectively inverted (and
therefore incorrect).

Honestly, in this specific case, the simplest solution would be to fix
the driver, since there is currently no upstream devicetree using this
sensor. That would technically break backward compatibility for any
out-of-tree DTS (if they exist), but those would have been incorrect
in the first place.

But yes, this seems like a good opportunity to discuss and define a
more general approach that can be applied to other drivers with
similar polarity or naming issues.

Krzysztof, any thoughts?

Regards,
Loic

