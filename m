Return-Path: <linux-arm-msm+bounces-68817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFCB22B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401061A2789A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D561DE2B5;
	Tue, 12 Aug 2025 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqreRUwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A982D0C99
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009944; cv=none; b=AzudMW3uTShUcbqhXqGzd2Q/qzL56Ro6IYXMDP7arPfqo6Y5ir4tsNY1qNKSDFxMhRRNE5NkAPj4rCXp1mDjm3OLIFNgkdScUROW3ckBTBgfwESHrkNTGO0TK46WfWSo8z4qsSr2tz4D6ABk1+I6Z4aTC/2oBg439ASS0d1yQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009944; c=relaxed/simple;
	bh=BsPUwKo2RgN3PIB5w5A0XiTeMyiBfC1bkz2j59r34M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxBWtC+HmKm0e+w2Q6YU+7ga/REpsNkpuDJK26ngwCYmQ7HmzGQUqlku1Gd4iby5is0O2DxivalFWHsL+FNTPvwVpoj++PAYs/XCwTWqYq0tGCuHlyaQIZVukNPRL1psKnGjdJqaGWKmym7cSYc6NDh22KTJX9yGWvqJYURDacs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqreRUwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAwkGn025655
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xY4ybwBZU/5eLYxDAWc6jB33
	jh5tMDovV2YsVXcnASQ=; b=MqreRUwJQGKu/vdT+4GzlA2RsGs00SJaxFKBFkSs
	1JCr6oWHCxv/17JbdIMePea1ftaQcRo967TDVlXOQL3K95XXKmeTZblSEheh95PI
	1iKMKwTHg04dmOwUAghBgPb75ODxB/143K6b1fRiiKAgrB5U5CSwia/CAvbxFZur
	r8/a0UwTE6KWuknjsDZdzi7n5zVfnVw8VcgRQdXScQdoPNtJM11LpIWs/VYfl+Le
	Yi75uk+BCbulUkBglpf0lo9466nxj5SJgbDPdEOSmy6pvQNWdMHDwlmmcJ3aALnf
	Jg3nQP2T8rc3hY88F5mEIuk1a5/Ya1qzyrHVfXtr084wgQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9srp9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:45:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b076528c4aso61475361cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009941; x=1755614741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY4ybwBZU/5eLYxDAWc6jB33jh5tMDovV2YsVXcnASQ=;
        b=uIEHahh0cTeq17pN0QzaQw5CJc2perFSqRH4XoHUtD2Ds/xlSrBP1ue+CdBkI9ZCw+
         XsdM2JEYx1WdLRnc7V8Zh/U1qZNNwlZV08qwZoXP+loHOAL/XON8W5GopNAv09UD6G0p
         2ORZp+64vBoPww4ful5cvYHrhfrzFb63uYAJeN7rdmzYwvzT4C/wEnrkrWp5p0euKgEp
         e9NnVdy3fFa3uTaTdCkfUWxPvsRTBx+emu/ZyHWR/XWnddDPl9K1XzKGJZlYbQuuvAXS
         U7K8uX2fy9DYg4MH+1Zi1vD8m+uCKB8FjxRhHsDhzzIOeBLZamJECcZ37UONS6wb4hqS
         TK8w==
X-Forwarded-Encrypted: i=1; AJvYcCVuk3us+4l9rL2YaXs64RkG2i1y/Vs5zaNTwYO5jX4IQ+avpkp+wcW36J+msQEnwyw1MoOSWLLJzlBU9gRM@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTepB59nwnjIcZS0Mrad4GDwnli0PVDqiryWCKUkI5GaDQ6bf
	zCS/ttcbDuUaiPxB+057oluskOzFnl0FsD+2iVLJE9dOfA4ZRKnr/YlAKrO6faLzzga3V3SwEiU
	oyWbDitd21Hzg72nU+IwN2i9vvKnzrvi4Ooy+k7CnSj+hveGE6miXcQxOhCkk4Ty7+ghw
X-Gm-Gg: ASbGncuKqdfXEyyDHbCQ5hLwLGlQjBivGc6MdGlIxTx6lxtAABrmZ64YyXA52nze1/a
	6lL9TpGDGk0L2LEneJryhLIE0aoiGD+ujjujwaC7fYSwas23wpe9LgHHHrck341awQmB2mkyIZv
	u0KXjQE+xqQQCcbYhkFvn3vWyJpeAJd/rg0w/n3o9IrKG1TM/rezSnBEDbHHAEGEtZEXti/d6Hg
	Z2FOvu7vK5iCpY1z2blMWWkCKhtCbBgOaM6aamJmm/sE01q/snEXI4S03g5YcfNsaRz3MlnVYv1
	gmLJYyLrhuwSRbxmiB9gCkrViO72+2E39y+zkawQx6rj5ROnTbjvu/Gc+mKEExCFszk/2Hg+QdQ
	vtEr8Wwkqw+Mml6s/2C9ofjPmjSTwW2DTaWKhXKpw0SsyLPbPJJw/
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id d75a77b69052e-4b0aed0bff1mr245432191cf.9.1755009941238;
        Tue, 12 Aug 2025 07:45:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmYy8rE3bdSKUsBvaAM/ijKkrxlBj6I9ke2X5s/PiaMRaKBrdTRaQVzxnYmAAxXiVyybZVRw==
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id d75a77b69052e-4b0aed0bff1mr245431671cf.9.1755009940667;
        Tue, 12 Aug 2025 07:45:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55ba00b78c0sm3769141e87.68.2025.08.12.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:45:39 -0700 (PDT)
Date: Tue, 12 Aug 2025 17:45:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Describe the first PCIe
 controller and PHY
Message-ID: <xirkug7igbf33nkxtkpdnma5wsepndasmka6fp3q3n6xsk4npj@jucnjfd7bqc2>
References: <20250811-sc7280-pcie0-v1-1-6093e5b208f9@oss.qualcomm.com>
 <8d5eb27e-e299-4fd9-a591-2d90f4693838@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d5eb27e-e299-4fd9-a591-2d90f4693838@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b5396 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QUNwyAoics8Us-WNJDcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: AEUX6qE_Fo1p8-r95UTrLfe5kcfXPkyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX51uZRDmzGIUm
 w39FNiLlOfhJwyt+Am2mBaHm6JQ77npne4qzd63FBhKSHuTeH4xTScUJkPDcdQN7JnNaXSwTJDv
 +urt1DFsXtiFk5wRbm1h+rmn9xTrIJP018Yr3bz/fUbtSgHEk0ROJzpNUuLCa1ZvPGB70FIBpBb
 2EVuylcJkSC8eKYdtFIXx59bjtEFUyh9be+XvSackZZu8VzCiCFuoZHT24Vp8wv3pmf6Sh3ZI4K
 +JjkxFpVBBWvaToF0SUOaxoaN5C/qfkud8Rep1Uvh1p9OqZpZQkXYeCS8M7yF7SR3NZ7wlWYeT/
 EhNJUfhstZYqQa2oKBoN4JKxBDXdmeB8cTRLvUKonbpwGakM0QLeXTnrdHLn8DGAxxJDzYtHNWX
 SsEXNpn+
X-Proofpoint-GUID: AEUX6qE_Fo1p8-r95UTrLfe5kcfXPkyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Tue, Aug 12, 2025 at 01:34:44PM +0200, Konrad Dybcio wrote:
> On 8/12/25 5:16 AM, Bjorn Andersson wrote:
> > Only one PCIe controller has been described so far, but the SC7280 has
> > two controllers/phys. Describe the second one as well.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pcie0_phy: phy@1c06000 {
> > +			compatible = "qcom,sm8250-qmp-gen3x1-pcie-phy";
> 
> :(
> 
> BTW I noticed that Krishna also tackled the same issue just yesterday
> on the internal mailing list.. would you prefer him to take it, or do
> you want me to review this patch instead?

That means one thing: a lot of our engineers don't need to post patches
to the internal ML.

-- 
With best wishes
Dmitry

