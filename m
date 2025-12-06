Return-Path: <linux-arm-msm+bounces-84543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72CCA9F0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C64C3011B1C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8783E27FD7C;
	Sat,  6 Dec 2025 02:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U82SCz66";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXqh9kke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14435265CA6
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764989021; cv=none; b=f0W3Z6VucG/4/U1I5O/YRpdounMY0p9O1MH1rqcsi+lHR5Cqu2Z8K1jcHEEVoV+JZiMazYWDd7SMRtGJh9LC8/A9DghzVy2duwnLFkBYSqJSbHuHnpCpVnAsLw1VUS2MF7vxeonV0mWQ58CcwKq5oZ1qJAaK7B8CEnY6fjj428Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764989021; c=relaxed/simple;
	bh=OR5CXC5hjh1K3IMJPmPGgyvGMU2pcuLW4ldnAT3ZXhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzLF8GVX6G6ZqiWLc0Y40IzTX4PRvo9L1RPL0fcLZ+Y5S6XrqpCkoDj4aBN2dy+n/fcgDIDsobI6bvmE9X3jr1TbFRY/eYU+XZE/HQOGm6hgKyjFHEAw2oVvC0pLFSW8xdNVhMfdYceYZOC/spVBcb3uHX7IXWOXRIzCjNLOjZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U82SCz66; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXqh9kke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5LA3fn1421756
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6qdB92NrUnE30hMtrFtmDppz
	IqqZd/sCj3rQH3V2RQE=; b=U82SCz66lUkDbQ61cNEHnT655oqRuNorDM2mcV2h
	PuLngBiKJFrhwrZ+IaIfjW/TnUnsdvVwhFRFt19CHhW1J3VoJzEhZthJ70Sbzd/1
	Lz7pm5L22FBAMx7LvLXT1f4mW5zZ4XZh68vkJnK3SQm20qN0zJnn4PddINn6nRDP
	YpLmkFbjBWPj0io6U4pDZ/p0li5BGSX85V83amDSzE3tPjsfn8d8t3x2eTlTVM9C
	QxrjZhJ8q35mMhODlob2yggX+y0V3Gnn0bvwdpDPpA6FzzIgFkya85+zgI2XwNeg
	V7LTCGn0JAvD8nUfQUhakWyb6lOiDVGtlaFr4m2J77AY9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av71kgkmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:43:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88237204cc8so65729446d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764989018; x=1765593818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6qdB92NrUnE30hMtrFtmDppzIqqZd/sCj3rQH3V2RQE=;
        b=MXqh9kkeSBdrFBp00KJHLQd9jLqN5cfbpHChGVMt3CXO7gg4q4Ye2evLrFpRK+56mb
         M3fsM0hAPD6TOVCGwf/VY34hTM/pZUqAmz6Bz1G+dzlEyQgHb4CAq2hihNKhG/fqAHlr
         E2asTyMMpP4KK26KBtVgigjbZ0eMwdntvCxxp2venUKbo8iEjidHfX2U/DEbXX18ii2u
         /oEHm1q8/uyc2TXOUsJXq0enGb747CHifH8J4MpJFjQPTZcAwu7+Vcxr3dhPsW5kUNF9
         7GSijRTxojU17bZ5emmWiaDKe860L51Td0t9aSrSa62yVYg2kVhO3QSsHtyZXIYab1qN
         UXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764989018; x=1765593818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qdB92NrUnE30hMtrFtmDppzIqqZd/sCj3rQH3V2RQE=;
        b=U56oe3urgnbZ0n4hwjsQWnunBQFTdg2u7fiv8oCGfr2MI4iAmyI6ekyhzbfhp466ic
         lFqa3dFiV5Lv3Ejf6mw5PsUxufD8BwjOJD2mm0w6VxmDOBbqRagKLsddcmNqmKkzCGLU
         1eV+i5rSTCtJDK+sIR4KyLsRb1XZDoaibv68trbqy9G6oqUAesaJ/bJ/a+N9Au5soLeD
         M0x05AL2fmOI+KBS59mRq/QkFwwA04iS5eIXsxkjZQBTPoDHNgz0+K+oVwdk7UnJKA68
         F6KWg1o2gnntO9hGE91JjO8DXu2lAWSE2IHEsa3zlqUqKTSUMv+LHZWy0XxZ6TCwQXBq
         ztHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy6OZN4GlvUEFGlZw4eL3EuyaJqD0QZjsbRo42yREFEznSP1IDJFyUIzAVqARiLWwyL1umCOjsTZFw9Jb5@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSKFmhpjPs8y0ajdSbqGAz+NUO2Vy3MPGvz19f02Fib/GifT0
	Tf8aCe23NNe383hn3fMkJWw/+dv4yIOOyD8WEM7QdTIFEaYkwLYG0XOL21J9aR1hVxDUdT3yUvY
	qbr/XfgB3CRddc/9OYW6kU/7NUyBaliVGZkw/nEFrVTgn++7nOeT56MtyaOgtF7dNk91a
X-Gm-Gg: ASbGncv5FWyRVLgfz1AreyLUXz3wxI86opTpf0do75dylwel0zqBBuYuUnMaKbvO6pz
	82dHR9RTcR2sXPUqUvnXBE9YcB0IPK7entu7/e9mmUziIKF3z8/xNmW00/ZSXzlDhFNS6CU1uGD
	R6eeSeAW7kaT2OB4/O+e0zL1QOOJmsPDTYwOhJNvP8Dx/cm5LBzXbOJB3WqOS6q7GDPe7zF7Ynp
	N3HTZFLD/10FIYkUahuS/gqpm3uQTo25zFQbjzNzAgRxTXK6L6Y5C3tRdxworjegdIH+UvZjfgD
	FLYXm06e4mbCoPSDIrUVSRAHV7qat38G1+wama27AHgObd6c9FM1VjEV5hklVAG3fzM14bx4XCP
	rQV7J3TjkusnmEOsbANavFp3wxgRskPJpXAoonwu2u/HpL7zHwRjdqhDcbYVbX6V5fKEhksEhDl
	qPcS9MbLoHx2UMagUNrIaWreg=
X-Received: by 2002:a05:6214:d43:b0:87c:27c2:2c0e with SMTP id 6a1803df08f44-8883dc78f56mr24444636d6.59.1764989018256;
        Fri, 05 Dec 2025 18:43:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELopBkTwTrdevRKNQDfOKNRvVoSoxLp915juyNubfc+TFAj22pkfu7ReqUYjQ67qriMH+srQ==
X-Received: by 2002:a05:6214:d43:b0:87c:27c2:2c0e with SMTP id 6a1803df08f44-8883dc78f56mr24444436d6.59.1764989017867;
        Fri, 05 Dec 2025 18:43:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e705e8292sm19913161fa.37.2025.12.05.18.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:43:37 -0800 (PST)
Date: Sat, 6 Dec 2025 04:43:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anusha Ajithkumar <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <luhtzwbic5a6a4tl5coa2zv3jxoo5f6sab7gv4gcxpubv3ioye@h7xlfx2bxcgr>
References: <20251107105735.1491273-1-tessolveupstream@gmail.com>
 <20251107105735.1491273-3-tessolveupstream@gmail.com>
 <badmoityubqmjsxune27vrh2e6htwkhvnak4uj7iiixnxhjpkm@qi56e6kilyt2>
 <db3edb31-4a1c-4512-ac46-ca3b4e9f187e@gmail.com>
 <CAO9ioeUVx_qf3no9aLgZ3OQQPQ7nG-2aTx8SHaEN5DUf02USWA@mail.gmail.com>
 <9b0c7cac-3577-4190-883b-7de26790b8bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b0c7cac-3577-4190-883b-7de26790b8bc@gmail.com>
X-Proofpoint-ORIG-GUID: PeEI8ST4EwQ3j3X5eOVSeoCtjU1317d9
X-Proofpoint-GUID: PeEI8ST4EwQ3j3X5eOVSeoCtjU1317d9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxOSBTYWx0ZWRfX41RiDkiOZrS4
 J9fx0ENUTg91wp84LdvgGQszb/uQur+clyY1YwnB5eIiW12CdZNcy8F6mSXB1EfqHYV8UrnX4pt
 M/L9sv0y19z0zjCLdXhY5Bdap3jebiZXgWRZjIzESw2LmZb496XWwXszNJMegACDbw2qw1QrZgF
 AplroSFK4XMq+Y28bmK3ZP69TzTt6gzfIIjT/kuPNkqdRaopS/D8gpJkz2hLU2cDAD9YykL16R8
 HPXC/qabMdE/hmVo837PWYCG40bJnCXN3lTJ5RLTPSlD6D8MJ9CV8Ecdsc+MZH3bAuJE+We/8Zw
 nORMM0rx90/M/4W4xn44o/aQH85UCxrPg/wv/S3PNZxuK6Eppycqquo9kTxF5dv0OqNuK0PKna+
 qq1HZsUtYYFCjzV8j5xFW8TnGz+hJg==
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=6933985b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=M1JfwU0wTJiejCg4RHUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060019

On Fri, Dec 05, 2025 at 10:58:56AM +0530, Anusha Ajithkumar wrote:
> 
> 
> On 03-12-2025 02:36, Dmitry Baryshkov wrote:
> > On Tue, 18 Nov 2025 at 12:16, <tessolveupstream@gmail.com> wrote:
> >>
> >>
> >>
> >> On 14-11-2025 01:38, Dmitry Baryshkov wrote:
> >>> On Fri, Nov 07, 2025 at 04:27:35PM +0530, Sudarshan Shetty wrote:
> > 
> >>>> +
> >>>> +&uart0 {
> >>>> +    status = "okay";
> >>>> +};
> >>>> +
> >>>> +&usb_1_hsphy {
> >>>> +    vdd-supply = <&vreg_l5a>;
> >>>> +    vdda-pll-supply = <&vreg_l12a>;
> >>>> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
> >>>> +
> >>>> +    status = "okay";
> >>>> +};
> >>>> +
> >>>> +&usb_qmpphy {
> >>>> +    vdda-phy-supply = <&vreg_l5a>;
> >>>> +    vdda-pll-supply = <&vreg_l12a>;
> >>>> +
> >>>> +    status = "okay";
> >>>> +};
> >>>> +
> >>>> +&usb_1 {
> >>>> +    status = "okay";
> >>>> +};
> >>>> +
> >>>> +&usb_1_dwc3 {
> >>>> +    dr_mode = "host";
> >>>> +};
> >>>> +
> >>>> +&usb_hsphy_2 {
> >>>
> >>> So, the labels are usb_1_hsphy, but usb_hsphy_2? That's not logical,
> >>> please fix one of them. Then please fix the order of nodes here.
> >>
> >> The node names come directly from the included talos.dtsi, where they
> >> are defined as usb_1_hsphy & usb_hsphy_2.
> >> To avoid breaking inherited definitions, we kept the same labels
> >> in our board DTS.
> > 
> > Please fix them in the base DT.
> >
> 
> The inconsistent naming originates from talos.dtsi, which is 
> outside the scope of this patch series. Modifying these labels 
> in our board DTS would break the inherited node references 
> from talos.dtsi. >> However, I will reorder the nodes so they appear in a logical and

Please fix the base DT. There is no such thing as "out of scope".

> >> consistent sequence.
> > 
> > This is a prerequisite, no questions.
> > 
> 

-- 
With best wishes
Dmitry

