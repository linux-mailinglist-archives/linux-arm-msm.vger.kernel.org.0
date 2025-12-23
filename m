Return-Path: <linux-arm-msm+bounces-86368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33616CD9E2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 068A5301B2F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D542222D0;
	Tue, 23 Dec 2025 16:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nr+rp8pA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kscAUAzJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A220E025
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766505655; cv=none; b=O8nnoaENQ4iCi4v8Jd+CIUaoS6aVzUCm8bNDYwq5xwEms/ZR3GZ3KxrJzQZfKrjSnVrx1HqVGZlkhML4LlYRo3cRyX9ouLBRN1U8V2qQUonJyXuK5v5Te8gzH0SA5sqebtN1Q54mAxzScmmFRcX0/HANUWBOT+U9Gh/SCTnbnzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766505655; c=relaxed/simple;
	bh=U8TyQvJwYC/7ZZY+a4zcbRXifnhqatiepRyUEU83pw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/fEu33htQSRHBTn1uadnn7cQaUis13dZ7rorgILMJmC7Y8emUIPe/QxhJRdS4eyb1cGd/nZrsW6nwrs1q6pbBvqKFXE2uaE+K+1u+B5lRTsgVPz4fZxEdgqhJSX1hJUyef1eGgNpWPa+ELD/lw4S1Cw88J8AdUw2aZnJC31WEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nr+rp8pA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kscAUAzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA0Jue1570353
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wf4+CwSpKPc/Y1J8w9AFa948
	/l3Xxemy6xO0cQgHFnE=; b=Nr+rp8pAgz4bMCnFp6a3ZEv/uu3Vuq+b0FOJkKLu
	cV2tWjEdgsOS2Ooj7oYr8YiutOJa7gwZ2aiPJ8asRkz57yEchxFPKBf4N+q7cEox
	R3TXT/sL3a361EqvwB/TKuJgtckNwt1MqbaL5RgjWUzmkzWG2t66IfzKK9VnvUyV
	iGcORF+qd4NlLToBGLgKjxHgkz51wrHKs0EUdOpoqAnF1vJNpZ2x8elq1pd8lZhp
	MCfwYWI1YD5sp0xGKS66H7odmuwTFFhp6Iqro9LBTCTF3CHC694WTXe9x2QH+ZEf
	aK/R1uPlEC9XCHXCxw6SNyOgh4WIPA29JtROTikBgp2jVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy46kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:00:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f35f31000cso72227171cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766505652; x=1767110452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf4+CwSpKPc/Y1J8w9AFa948/l3Xxemy6xO0cQgHFnE=;
        b=kscAUAzJ2o6NpUu31vZ9OOuxQ0b9Qr4yHAp0pCLSyMjxZ5c8eLvGrc6Lpk/BUZosrQ
         /70dpmC3H+8Bu6EsbKlCPtzuZ1ZMCiVxcdBe0c3epnR3R0LV383ONXmEfFYMx3+NUDfJ
         LZheAVXgYxb4mjuBewJBG/X4QnD4PxNtSsDdORiUdwrfc5bNyZjvbU/pcVGt7e46frpx
         zVorWWHpHpEU8pLw0Ef2/Sd51rF1jdsVT2J1ieK9QUrfzUVcA6UXMAbwWAnnd4+KG4Zt
         s4YAH/CsOcYpIpPzJmaISuKo9YjdTqXsHlTN5+KuY3QU66Y7DbpAErTVmYTeoEjA6k/j
         swYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766505652; x=1767110452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wf4+CwSpKPc/Y1J8w9AFa948/l3Xxemy6xO0cQgHFnE=;
        b=f8XAnx/rkUuUvYCoK1/RR8taN4VJ96cyIOopfQVbMKKFUh7JBvC6dgIzywwfdxD7ah
         IG9A7H6KTB7F00PvbWeftKspQtZm+N8jRtoig93mbO5LXv+BNPD+JHa7HkMiEJ8FGI+v
         juBHyVNquRqxPo2oRaI6p9cQC5tjTTv/MZuln+m1kh+OziB8qh3/DXrg4BBGQKLKjGPD
         9RUf1k7xd3pL1UdPDgMBXxnKPOj19NJCcwBioxs4LPwc+tIfdpEIC8kUln8z6gcYPpGZ
         satgj0akdTdxbyHMyjvPUgR2Vg5OuqrLKj5je8acx45dwEvYWEhUMErCUda6i/mVBSzl
         8CLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI3surxvvxmeN5PqgcVu6yZ10kWS6bP708d+UFdTEzK/V7VfrBRgoJkqZ2bD/D2KAGChyOE/2IDIMrsJsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3//Ww/z7PXw2PodmpsaX2+emV+90FcpojZKa82ibPQF1reKy
	hig6tGnZpT1UMJe7Sr5quTNNno1YZqkQDMp1uWcCpUs6oQfbys5UPsTgr31seAuQu0FvUO481Yb
	kKFiqrpuF6xqQV6H+AAvdUnJ590ShZeUSvHHmNGyiUIF1T1QLFfHOx9KYJGLTut+znlT1
X-Gm-Gg: AY/fxX6A5ciYx77BgyLsAZiQVRtnmvz/oahEY3eEsQAns8hlnEZbFj/yWhAuCS6Sehb
	EujejqsP1ZAWRyzbrAj7aUL1a6id0dQLZ66n2Y0SuqFuo+EKRVjilejZC/KzuPSc5fQ31ZyJ2JQ
	33ZHQQakgRo0fH7vah7wGtXYSkLFwhB8h3kaouU5KqM2/bv38ihACAlJD/Xj2PGSI7aASnlIStv
	3mDIdD0vX9oraN2P+kizCgR6NYplUqM+4s4POMarfGl0qJSNhm4rMb8IBP4xPlY5dal5/B1wiUd
	dgo//HOvfTXzzinAxlU+ALQ5bXvwVFezFCVyT6bQv8TReXYcaCcesrp05rO8W7tl1Mm0bfYuAAp
	uuWWM6ktRI+9EHabx/8nkiQ==
X-Received: by 2002:a05:622a:a0f:b0:4f1:e9f7:4dee with SMTP id d75a77b69052e-4f4abcf9043mr220380171cf.35.1766505651324;
        Tue, 23 Dec 2025 08:00:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUQ9NfH2NQZJU7mtYDnuzRK+AhPP9tE6G7iactVTrFhz+atWa4wjO4IKj78Me53QYltT7HqA==
X-Received: by 2002:a05:622a:a0f:b0:4f1:e9f7:4dee with SMTP id d75a77b69052e-4f4abcf9043mr220378431cf.35.1766505650368;
        Tue, 23 Dec 2025 08:00:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm14276727a12.31.2025.12.23.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 08:00:49 -0800 (PST)
Date: Tue, 23 Dec 2025 18:00:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
Message-ID: <ms4r24li6bk3dvyjas5sor442jvkptz55yisdnaco6qdsyvsda@dt4lv3t366cg>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-2-fdfc6ba663e6@oss.qualcomm.com>
 <3fcd274f-2502-4b3b-8a39-daf5e1938bed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fcd274f-2502-4b3b-8a39-daf5e1938bed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEzMiBTYWx0ZWRfXyoFAs3MZTqPm
 xWAKM7DxT9R+ozZVN/WcXkn5cN/66nDYvWaJsNYF6XYr7ts2daL41bNa9ioBNBT1FRpmwNLWyOF
 7Lg4mncRz9LfBTDra/KwFXurr4da7uXTcAEb0HmXvqFBo8fDKOttwoWrTpYl0cqZGnmM3WI1LuC
 KEW2Y8vy/ePCu9bWZ355qPXS0qQMoSIPMCr3cqvf65P0wXaiRorSk6WqdVh/9NtqTVdfQqN7WBy
 xqmCG8/Rf3ALm78HZMB6eWpnq5vHLeuwpb847kARVcd59Jqn1S8XSd1BLvkfWoq+YfEBvjhzdPs
 5XwlX0yi0gJz++LXQNN7mDlzr+GYHQ02tqhg0kXUMO6Ams1DQB3whp1KtqA83zYscWGpb1kVPUS
 dA8+U/2/fVYvcQCW/GX8o8nLXOzOUCR5nSZs6ShUKfCukrtTkVfn3qLnkwqWmGuW7WPdSwvnf6B
 38takG+owABBpdLX4UQ==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694abcb4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zMAY4Xzx9T0OtoEEl6MA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FfK0FzOkSFiSHdubN2WbN0MGDJTk_1zj
X-Proofpoint-GUID: FfK0FzOkSFiSHdubN2WbN0MGDJTk_1zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230132

On 25-12-19 13:15:00, Konrad Dybcio wrote:
> On 12/19/25 11:00 AM, Abel Vesa wrote:
> > The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> > hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> > block, same as older platforms. So describe the APSS WDT node and mark
> > it as reserved, as it will only be enabled in EL2 overlay.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > index a17900eacb20..b65dfad71c2f 100644
> > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > @@ -8302,6 +8302,14 @@ gic_its: msi-controller@17040000 {
> >  			};
> >  		};
> >  
> > +		apss_watchdog: watchdog@17410000 {
> > +			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
> > +			reg = <0x0 0x17410000 0x0 0x1000>;
> > +			clocks = <&sleep_clk>;
> > +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> > +			status = "reserved"; /* Accessible in EL2 only */
> 
> This is technically incorrect - it's not accessible if Gunyah is
> present, which is only somewhat related - if you run a different
> hypervisor which doesn't explicitly block access to this region, you
> can still access it even though Linux may be running at EL1

Fair enough. But in the case where you have a different hypervisor,
I guess the EL2 dtso should be used.

So, since AFAIK all devices come with Gunyah by default, it makes sense
to mark it as reserved (or disable it otherwise) and then enable it in EL2
dtso.

