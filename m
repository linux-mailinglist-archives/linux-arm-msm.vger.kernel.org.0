Return-Path: <linux-arm-msm+bounces-59664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDBAC6515
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AEF91BA4FFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D728274FC1;
	Wed, 28 May 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzFiLyH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BDF2749E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422847; cv=none; b=WpGF975O1KGn7WnNL7IWHFjNneS14U01Mc3VI8M9K1ljjuE5NqaapzhG5uFIysLG9MXMpL1+ezxhpf1ucDACyRBjfx2/lPCHkPKo6xGCYD8Hr0aqpafGqQVAKWOrUVuWlSmvsTJk/9aTpEEZVk+p+cSQ5u0Y8O0XOvw98HomGfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422847; c=relaxed/simple;
	bh=4r/YBkwC51LF6bb03uDFY7j813T0E5I2R8G7R8JuqMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITm3oErdxD9ERyPHYtU4Pj4AwJ9bc5AfgOp1C4HOMaq1dCotaNP3kGnyd6kR5NNB1u3cWrka6ljYhflMRNOqF8CE93vDk9Nj0OWSRilDesOxnPlv8TAWlRIAC4O64daojIcuNeeKP+KBJJ1Bxl0W3ANDZS3sAD7LyKwMXFrdNLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzFiLyH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RMGQJd029656
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2mjSi52VDuOIqzhu/+qC9OKP
	NQzrY0pozp35vNraDBg=; b=IzFiLyH+shV+iJP/3J1hkJzMfO30UPgQ0+qk+fL9
	YfPKixuF861DjqDdVb3hlk0/QbhWHenkacR79mqktciUjQ4ADO6rli/VM8YjyJ6W
	f/SOYwlCkF2DYSWDmCcpYiFHIZCchwjeUPZVnaLUVmYl8P77hwaw8OJqrLG/6FkA
	jGVMl/DznoQz8El065KU356ImUzNukp2Uhv+n4Gr+XcHAx9fT0MHyLHnGaVYrAbG
	CO3irxsgJcVAbHydZcYlLq8oEzI3TfBBWBbWjR+s8v7/JWubBM4unnKDO4+U3KG8
	k5GSuL0ubWyVoFr0JL6awKRfN1TqOKitIayCpztbECwoZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691c5hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:00:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so602122485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 02:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422844; x=1749027644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mjSi52VDuOIqzhu/+qC9OKPNQzrY0pozp35vNraDBg=;
        b=qVvq/aA0OJn1zqdCnW5j1xdCj+66s/pJDMGIbe0Ic99Pgl7lfWDHtWL65Mx1ASB2F9
         FwoQgJ7OR80YcXzviwRuIXMihF9xUslbXzBZp8/cs9/Jh9DrzBz1zM7XIapkYi+p3YgT
         Sxv12CLAHUPX7iNKMkuKJ+6vKOUnW66nVgb4FQkvAg4khv6Q/+PSOUWb2CffcbjKdRWC
         uipl4+ZGVYchQUlx0FFHSKIXzzyZB+ZZplDsiRRPPwnQ+nnraIUeefoSqRAlHr4+SsP+
         NtadAL8h2jOrwqy8aAYmr2z/ejP+1woTUH2KKq292dvfGwXb0PUzX1mJCkhk5+YLDDpr
         65Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUgeavo/9Ri/ZppzKDH48JHjGD0SLfejeeMNzSGdLywDYWLskU5rrjBLBpNwA9j/kD0YjxARQCsns7N/0Ql@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgq4gvR4Mb2d0kZTB4OFbKEp19hKyjv/cRaVpnQ7NiZOp5vXDA
	qRNL1pAU1k3QZfFW+8qFqquk18zxPhtHClHeyUBgZbSmyK71bGQTFdPDe1uczO3v/yFlN7icAf0
	GFcLPja6gNYjK7KEqbE4C5PkQHlEUBIFhYs2czldktHYLHnzHhHIl9RVybbXFWGwRtKjn
X-Gm-Gg: ASbGncublbjHXeWyaxDt03HUWWOg8F2+OFRQ2JWVwBMSHjaYBltmB5dhv7s2nZnd7gh
	NVfkBjKwxucs+QsFC4H2xZPSoXHmJgcfUgEsEv4Zi55iUPx5xT8b7o8TtyVBp49V7UploHP6TEt
	IT8+CeKvU90e7wbWNLET1hhMLWkvdiZaVhb227AO6T7V5JB67xxgsiAUU+EAIw/a/IQBobSU1gh
	BTwY4BKJOpPZM5YQURXNoevojrvDwpLnOAdTOEqo/dqMj2cNOBuQk5hKQly6sZeStfrYOjpV5x4
	UH+4tDPXJzs24LSjgekz0l0u5LL2Cvb1niKif7JijGr9wqdNChPXuXXgTfv3kzuVxDFJ71TXPKQ
	=
X-Received: by 2002:a05:620a:240c:b0:7c5:e92a:cba3 with SMTP id af79cd13be357-7ceecbf9a21mr2666638785a.49.1748422843843;
        Wed, 28 May 2025 02:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhps16AlZrh7lPu8W80Ph0izdq5w8yJZHVSR7lQDLdhfKN1GF6pR+JV7jBPU8jReMa0jILtw==
X-Received: by 2002:a05:620a:240c:b0:7c5:e92a:cba3 with SMTP id af79cd13be357-7ceecbf9a21mr2666633485a.49.1748422843263;
        Wed, 28 May 2025 02:00:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a6absm190913e87.109.2025.05.28.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:00:42 -0700 (PDT)
Date: Wed, 28 May 2025 12:00:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Message-ID: <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6836d0bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=6X5T8yoRJbxqCL-bSjQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hC0WRM7kl5W_eC0xymv27G8M_BpHAxFl
X-Proofpoint-ORIG-GUID: hC0WRM7kl5W_eC0xymv27G8M_BpHAxFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NyBTYWx0ZWRfX1Nk2m2jPL/FV
 ytZMj2QJsjEbPTTEPSvbmgOdoCZsP7YEIaiTi6E52ehTu2A3eulP8psr5hY8gc3pINtpfXbH7wY
 htxQHEEiMgdsNazrVZ2i8x+vnwXVpfgVJm32h+ojjwTUe5Eg6vUfriU/2OOGsRC2MKaeJcCDEDA
 od7UBCLChzVrK7nr4qbwd/u7k23Z9ze+9SZEX1PXSBhydnPGxGw+DObj/+GlwXt4h79nXhDmbNb
 a0nOHPT+AeD/hNeZxHCkqbYDAinrTXSt5ZCu0SvHMy2gNwrNNIyPGTjLQCc7srFlcFJTtgRYYZZ
 4wf8z1q4VD7r16nCNOyarYEQxlDMnSUrLBts7enLHnOb9sDPmSopEW/HuoEFooVkoIypJReZ4Xa
 abBYVZD+c8KqFUmhax4UjgUbGv5n6ulttEF59blr0vfqm9Zb9SD2oEZ4FBVW/MQ/IR1N+9hE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=452 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280077

On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
> > On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
> >> Register a typec mux in order to change the PHY mode on the Type-C
> >> mux events depending on the mode and the svid when in Altmode setup.
> >>
> >> The DisplayPort phy should be left enabled if is still powered on
> >> by the DRM DisplayPort controller, so bail out until the DisplayPort
> >> PHY is not powered off.
> > 
> > This series doesn't seem to solve the USB side of a problem. When the
> > PHY is being switch to the 4-lane mode, USB controller looses PIPE
> > clock, so it needs to be switched to the USB-2 mode.
> 
> I didn't find issues with that on X13s.. Not sure if it's related, but
> on the SL7, after plugging in a 4ln DP connection, I need to plug in
> the USB thumb drive twice for the first time (only in that sequence)

Might be.

> But there's nothing interesting in dmesg and the phy seems to be
> programmed with the same values on both the initial and the subsequent
> working plug-in

Please try using a DP dongle with USB 2 passthrough (there are some).
Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
devices. Would you be able to see the USB device on a bus?

-- 
With best wishes
Dmitry

