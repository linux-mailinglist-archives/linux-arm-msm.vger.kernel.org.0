Return-Path: <linux-arm-msm+bounces-99040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGuPMsd+v2nA5QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 06:31:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE592E842E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 06:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77FC3011592
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 05:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2348F3112BC;
	Sun, 22 Mar 2026 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYnzp/4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzCRtYqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0919282F2B
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774157509; cv=pass; b=tM8IpZD5J88axazgkNdo3ZKDTkfce1Heh145ijQaHBuSOhEq3il2K/i8mYbwi198aejHuqE+sGMqRB9yxIYId98oQGqyfFqY7XWDW6HKl/h/FI/W4xb2fHTlWsYGPWeA2Mtyvxo7EBX/JTLw6bGWf1rbjGwheQTJmrbLLCsrf0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774157509; c=relaxed/simple;
	bh=KXSs/HcXhWiOOPMswor3shOWBLzA140o6i+GUpk9QS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dok2jfYEke9Xh0NnTced+7vMU9gTuJaRH7yWN4wEaiIAqg1WE9aDiIvktEs4zucvxS6471ykXaz/B8B/dgS4q0SW5I9iSFEg6jwWkYrVpYQjWITwQkXDJW2robjTVAvlHZ0/PCyNuwUsT9Kt1Z97pbSN3Fd32XCw7whcEUnrzK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYnzp/4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzCRtYqp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LMmeqn587084
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 05:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=; b=JYnzp/4XVMdkbgnC
	Ue3e7Q2azYQ0ehRD3mX08BeSOxwqD+1iepTPeyBtcRg23ixOXAXzcPRoRZAkkNvS
	oRJGyQxtbvBkHwLZ6HMA/YU8Oszb1H7GxOmY8S4ldynUEZvg94dqX35fn0LrBWsz
	bj05Duhp86cl5zD745UMyTBj2sovnfu7rQDJhrcvUCVDTLNmXYLwX5IMmB4gCHaH
	+SH56gHLzBLk6nR0F09zX8n3Zh7FhmlEeiYTa0xi8tAmL6NL5E8s90hNFAHF9W8+
	Wxviw1cTk6QjC2oRoa8XGBTlSiQsxKGXCBSeSnSNfg407zDIqGOsdCq1HYEYIERM
	zv4IDw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng1wyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 05:31:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0ffce2570so72969936eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 22:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774157506; cv=none;
        d=google.com; s=arc-20240605;
        b=DKQB2+1aYx7NYeK3L01n0QoiF5fKCxdxjHBnZHWOEozvlc5ubYB4qQSmShRWFAC8Mz
         lzL8a9qGaR1mF7k33wfirran9ytkDVjC5PRXxMX8Om4BKE1JKla4XDV/CxG+D7WS2VWH
         Dp/9YUloMINQfPehMtw8qgeIhk+4z+PvRkNCRSdw9lOQ4/VG8AlNVYcQxaTTyM6XJeyS
         5iKbOt3r+h1cBAIARD9+reBEokxQOkwzlvw8ZnqQuHDC+7djVIOf3NA6v5AIq0gRuF4q
         yNbyGclTmS0Dy+eGiUBNmwCY4q+2M42t42nEB2Cq3Bt74lVuhhAyx/Rf3nfn5yD823Jl
         +lwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        fh=Cldhy3U2oBrq8u7rzKTQa2x20iFriy6tTdXQ3WHS5Yk=;
        b=HJcYIKSrwIE3FAHpXGyzEmbcfEFdlPL3JijmSy7NkfPGs7OjBey+9PdSCXB15nfGV/
         SZtfNB7eyvEI3akp6sVBBICylUzEV1aFoDSH3g7uoH221TBlxof0S0GwnWGKLwZJjJcJ
         RH7nylL++dto/q5SXEHvAS2wM4EsdPtjAxlML0k5fcvI/vQcxku902YC5q4Pyet09sQD
         U5kAA4KxdN6guAwowMuwCCkGoMoyJK549DdP1o+ki6A6puaA/9MmzCeJi7HxkrFOfi/9
         g2L+HYYvxEzhaV7vnN8C2X+u7P3ufa+zmmttSYEIYLb3vpatJPvfA9uxO87uSpsyPon0
         aaGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774157506; x=1774762306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=BzCRtYqpHUdteTQMrH8UiEJEpGCys5keMQz4Yy55lDlUR3K2EnatCXSznyjDf5lb+o
         4h0yiyZ+36luAZqV/HHBBpva0kIVyC2t76qIndodohaVAgH18udQl5kHffGHlhb97Wnm
         mjT15aqB5Ouqz2O38GGPYPBrM4o4MV+SwAPxyqnmbPAAlvH4Of8/97VXVdMi4d2/C6Fq
         OvqQdjlyQ/Ljzl4xytEf6TZRb694Ne8hqRnItCM+vAlk3jFw2QOkAlQUCsjjXWPwLVkD
         roQL6/3xXWHStp3td0kbrAuuViOSQPvdMoPGwXmqF33F22CRPUOCaX1Ue2dxtsboAXo3
         127A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774157506; x=1774762306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=CIjIeW92zTSQk4NpJnJD4243xDTCVHhye3KJqqZKDpcIu7k6vWCdrKuHHOgbzsxMGb
         aifHAj89Ci81F2xRzB267t4J0laXCQmx6M48rCTGqt6XIuh6YJTFTBRv24CenyfhuWoE
         1ia3cVBGl57NVJQXX5UlsqfguxZMCGHUub7+R55qI4oR4qamIQflBw3dUGufxDFev5DV
         3bp5i6AP107kEIFLwTme6EoseWC1h87Sbbis7uVclu24i2nRXOx4ppuNbsF+7VwwxW/n
         RzBHvKjqtu6G2EeF0AlqUTXK1df4kiwtO5cJcSSotzaozc8tqT/poR4vtszO4BeYnAuf
         l12g==
X-Forwarded-Encrypted: i=1; AJvYcCVpfAz1iMemfbJj/Pu11/COdv7gRseC3WqdrD3UgyNcSTaE1yM0S9FAPXJFkuqlTWHG425n9EOV80B+Jbbc@vger.kernel.org
X-Gm-Message-State: AOJu0YwIntxwJDj+igayhqXgCA+kHFndkCR0XPah4OAyhWyNmfxhKBFQ
	Yyt6AtXZmxWRP/48dZWMH/V4ffqhbAbjbXFNLFefTw30cNIVrav4EHND458IO8kY1LfmhTGkHgN
	Hwsf5NhzLA5SreoxqDP3xzKjgT7tNNp52OfA+bixY6/z1MIa0+VJuFyWOm5wxhMuuDlZSt2lYHr
	++S1xD4emm63Ho8lrjbPNKYHC9hGjpjTWHDbDc7+SddPE=
X-Gm-Gg: ATEYQzwoorQ+RVHZ1Wv8W9nausYtX5bH6iNpn2g9wYHIR3O/HhuKsdF1Jvvh49qKKux
	/ZjzMlAArJ2rDMd52uLAvDxZOIH+1P9l1ubS3CET0+GjI4dh+6wMgUDp8AhEjztxmTWaVKpWT+A
	uz1tkWr4h5ED6oLenoItIIHxuI8nmIrG0IBHiEjbR+BNHq30VBKWaF5NxJS3rzep3Bf1yqD1JVC
	SgatNw=
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c10962a891mr4064918eec.13.1774157505612;
        Sat, 21 Mar 2026 22:31:45 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id
 5a478bee46e88-2c10962a891mr4064899eec.13.1774157505124; Sat, 21 Mar 2026
 22:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com> <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
 <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
In-Reply-To: <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 11:01:34 +0530
X-Gm-Features: AQROBzCzhjx0vKHwbPAUpiSfar1k4cq_wVtxI0SjsuisfOaHCCYWgZ9iiMzXYhU
Message-ID: <CAGptzHNyV=cFRyk=K=uXt+Jf5e-ONec8ih=h-Mr2x-xo_bmbGg@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 045tLKL53CNXJrOiFzY0De9KQ-q26xQ7
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69bf7ec2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=CIsBWlCQImJ4_lLhEykA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 045tLKL53CNXJrOiFzY0De9KQ-q26xQ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDA0NCBTYWx0ZWRfX3HJCXkb6IVwB
 Sxw5ZD7hBOViuyMTkLBuDAGoFevig9LofXGCjlqiuplnt+GbEgg83GPpWIAZyl2W29K/eE+Gmqb
 PFXZxgaYPQpYsGgrafVlIq16hwRtexLVKNVOZgWkNFFJ6qRmnZopZBS7y+a/b+OU7hXlZO5DQEt
 TklwGaIQL+ZE4UZXhu13KG6DOnOvvt1rvpvapBz1yEyXzTtN6VOSm39UU3/50wlYDUhR69pxd8b
 Kx7f+jT+Mnh5mQKN3v1OVizpDA8U1wIJqdiOnkyzxlk3z9EG/2zUjRZPgv/xkd8DuLv8GYLURFO
 yn5xdOMIct/P782etcI7nhQilpC0hJ8U49ymFUVQMyVWrS9G2kOkysZFOE5rreKTK2aHGEsTOTl
 AMcIjkCHVLia9vPOiCnf1dvKVgODNHQxG+Znu3qgC2jVYaentQ5oelHpHVFwsJc52jHRdMSokG3
 GR0E/l6PVV3tcarDb9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220044
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99040-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FE592E842E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hey Konrad,

On Mon, Mar 16, 2026 at 3:05=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/16/26 10:03 AM, Kathiravan Thirumoorthy wrote:
> >
> > On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
> >> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> >>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> >>> rdp504 board.
> >>>
> >>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.q=
ualcomm.com>
> >>> ---
>
> [...]
>
> >>> +    firmware {
> >>> +        optee {
> >>> +            compatible =3D "linaro,optee-tz";
> >>> +            method =3D "smc";
> >>> +        };
> >>> +
> >>> +        scm {
> >>> +            compatible =3D "qcom,scm-ipq5210", "qcom,scm";
> >>> +        };
> >> OP-TEE *and* SCM? What does the former do?
> >
> > For OP-TEE, we have use cases like getting the random numbers, remotepr=
oc PAS and few others.
> >
> > For SCM, setting the download mode is one typical example where OP-TEE =
doesn't come into picture.
> >
> > Please let me know if this helps.
>
> I think it does, but it's odd that OPTEE wouldn't handle both
>

The SCM calls are the ones handled by TF-A which are usually referred
to as SiP SMC calls. OP-TEE doesn't handle those SiP calls but only
the SMC calls in trusted OS range. So yeah both nodes have to be
there.

> fwiw +Sumit is poking at OSS firmware for other platforms and may be
> interested
>

I think this is a WIN family chipset which only supports OP-TEE by
default. In the IoT chipsets there can either be QTEE or OP-TEE and
the bootloader (U-Boot) apply a DT fixup for OP-TEE in case it's
present.

-Sumit

