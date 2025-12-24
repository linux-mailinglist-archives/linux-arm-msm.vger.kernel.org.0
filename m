Return-Path: <linux-arm-msm+bounces-86479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E40DECDB760
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78DEE30255B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4D83271E0;
	Wed, 24 Dec 2025 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkmxE1dJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="be+yO+BA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B42E1722
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766556883; cv=none; b=o+yL7U7xrMxnM9rGLAsc3aPwzI0/AfNs2hg6VnWQhfpLRLwGqYfq54jleevYE6gWCalf3FW9B7X6X+se84Ee+GxvQYJ/kiwAfRfBGj5OFmUL3iDs9KGng1EQi4AxyIGUi3wnDIvZXxF1YDJXT2mO1jgtItncTd5oB8YvySawokc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766556883; c=relaxed/simple;
	bh=PJnE1DErB7La5yMrli+gyRX3QXcDFOqGxnA5XMBXh9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baVIXxKkDbQV6QIsl4cUppPB7CILTx0UvZ+VwWy6s8URD8FWREKVacHVDy8lSC7N5j0zML/PYtYVofwLvjrdHUlZFzTQuO+a8dCE9KW44VBq6xPdMkv7dxzfdgHg6YQcz2RwYrMArOu6eRuIc7D50LIv5gx2/FQUpdvvb22lVDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkmxE1dJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=be+yO+BA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wcSE3797042
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y4Y2eJpd01HJFBoLg61yskNy
	Rk+YHfsRYzlZDofyEvs=; b=EkmxE1dJax0sqron4lSpSGL9jF6pJr6tmmNMRWPP
	brbzcPzXYT0+CZC+phy9PCKoFll+tgH3Irb/9vKzrOnmwTzTIbG1ndXKVyQDqYcw
	FGDi1GrOIgSXnkhwNZPsxtExgbZs8fETTcZiKBGv7abQtEOLG/cYhv5AHRnTTks8
	TQ6iFbGU1wfErsptEhLY39uJTeRC9C8O+glLvIX7zOtaoXEyVeqM1uMsRxO+FHtE
	OuTcYTtarEO0MfKHvfkMo8I9v2X1AqXDU0pBOQoYzvIVaLTZRJ5GLL+xf+eqt4E2
	LVt2SXb3v77h1b8bt+nhmXL9pa7ZmTzoMBDaPXttlfFivw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r689dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:14:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c196fa94049so3972488a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766556880; x=1767161680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4Y2eJpd01HJFBoLg61yskNyRk+YHfsRYzlZDofyEvs=;
        b=be+yO+BAKhvB1dm22fuBkIjr74y6HWo6uyYWzZcZO3U3eG5NHz5FBZeMGoBMCPhiOk
         AzvOZe0V5OBPPo50tPr07g0bFH/oLe507RlzHy/YvsOMFADvjWW39mIdaTQmNRTWzJFd
         ClXVkwRIlHFPIFIpK0njvlSNgWdGGF6Y4SjPxIX8Wl9GytUPRRMRBFeFJd3tNUA8QgfX
         4foxqx4/hJx08U5sKQ6UzdMCv1oCmjSx7s86KUH1ZOgh9hVBG/D9vn9+85KL4HjD7cKB
         Qg2vo4fKz/K6wLg9oRwJzyXRZF9zAP3z1clUEKrOPy6HltZnE44dbgxNx/NQ5r37UdCt
         bWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766556880; x=1767161680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4Y2eJpd01HJFBoLg61yskNyRk+YHfsRYzlZDofyEvs=;
        b=M1tmjcR9czCTMRx6UCBRRBusSZqvkYEJ0reGx75zccEIkAkEps/so50mCuPaHOYQk5
         4st4uPWXAfQ9BnEtABlrBw1n0Ie539Gzm0TKqBESu9Kr8YLS9A9tOTJJlOb7KnJnBfGm
         RNF8/EPGXUe6uIAlUJR1McZd7Y1PqHkT2EHZO5hA5NBf6jGBH5DK8psn6NgKXcvHlTFA
         nS/EGmWSpNuheaBynaSBVkpYv2mZBvcrqqfC05UOEEwHq1VEUAHvyFfltBIqar6Q2Nhv
         YzI4+ft/9EiF0c7S3glCNYL7pIeT4lZHuubc7pl4XuJ47gzKsBYdL8Fh74MGxx7PjNNK
         AOEw==
X-Forwarded-Encrypted: i=1; AJvYcCUaLxzKQP9cgb2GxPCZjrRYaftPw8KfcCAaBphOpb6xiMoGnYA4i4UXcTZCDb39GYPMNg7JxGp9dytMAOaP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5viKLI6WoJ+O4/Ob60tdqsppI6GjD6LACxgnBPm4XxlEkF5e
	y0P4F5bR44PqlCRV9dP4bZWx1/5UxwoZPyWaMLYfPSIWZnTAJazrGhbdFmhdVnWLGjAxnH5ZlTZ
	zIlNmENLQe+4hgm2jsiurUYfeBUYeh87jYExt9Q1AfxrnerrDOSJ3MdKnNHYZV99INlSOhVbuMN
	fOJ0c543/cigd+yQeBiX+68ReY51alHi+oKl8VfiXdoGA=
X-Gm-Gg: AY/fxX5KLiNxNxGB/oqPJOQxfYkA0xrSo57b9ZpkU7wXDNAuLlQmH+DyWhTOshYQhre
	r37kgaGLYOsPlhcKq6t3YgucBfuw+/MU8EtAFtFSMAeiaWqUXNAgxbq/pe1GLBWXmn/SKZxg+Pq
	FFNBOZ5eg4YpBn7TkUIM8aHeGPWaqnfdpsCAIGJtrmettsE02ten6Yid6ZAitOwyrfSFDi9UVWK
	BwOIePZ
X-Received: by 2002:a05:6a20:549d:b0:35f:84c7:4012 with SMTP id adf61e73a8af0-3769f92fca1mr15946100637.29.1766556879566;
        Tue, 23 Dec 2025 22:14:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4JuSjzOmAsYq60WqT+iMGYoFGCeh7KItyGvZg/ifrCgKqS9atvgGzJQBVQMSMXaQOfMr1tOIJ3hW1Wqil7pA=
X-Received: by 2002:a05:6a20:549d:b0:35f:84c7:4012 with SMTP id
 adf61e73a8af0-3769f92fca1mr15946075637.29.1766556878842; Tue, 23 Dec 2025
 22:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-2-krishna.kurapati@oss.qualcomm.com>
 <aUqjG4pVXWN3H88N@vaman> <bb775051-8635-4e2d-a1f9-46d6f0e6bc15@kernel.org>
 <aUq51TxXwiJE2DWb@vaman> <niverh5ydbah6axshbtop56wjsoluen64anojp3nvizcn4bthr@h4yickq6gtea>
 <aUt6E-AVVVkmo6E5@vaman>
In-Reply-To: <aUt6E-AVVVkmo6E5@vaman>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 08:14:27 +0200
X-Gm-Features: AQt7F2p-49_voSHeXukQjIp0q4XfVcdPaPXZp-io6T989hQWj_PsEKJ6SPIeXbA
Message-ID: <CAO9ioeVst77YgcSZCp5p-e9V7iztnmeHhQ10TdLzDKHVZJ=zag@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
To: Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: SgLZcvMUmnRL3Jqy60JuoZXR4YwiUze4
X-Proofpoint-ORIG-GUID: SgLZcvMUmnRL3Jqy60JuoZXR4YwiUze4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA0OCBTYWx0ZWRfX2EMe7xdvN3Oi
 wMXX43q9yUr+z2TmGMx8clVn6jioBjWmQWleU/deIRKyGfGlRROd7CifFiHyWrLOpeCxslirn/B
 kaxX8FQftRUSyfWfAozTo7JoRwV8XFWrl2bx7YCa7Iy9JlL5B7y9wZkB6KU1CDU9gkuikyrrGLA
 bsgroRVvhPvJtre0A9IsRFTJ2meTZfimZp4kBoz3rBIiet7o8SYDM9dLCrT/UfO4hg03ulXUFnY
 RuyXhGzyS5Cn5pXR/p+OghltiyTmOUcWCQALG4Aevqcg7JfnJ9O2BQnUVS+Bz/gYrd/kKSTcpdw
 cm3jxnitQJ/wFddtEi1As1mb+dlsfSsm0fIfKKnY6m/0UE6bqBdh7bvRq8Ui1CkSPMvGA75sKNm
 fvB3ajYWGtd7pthviLG2vIdGMf1juAzajuQefwfV0aSWJoBk6B2V91WgTzelHQLq5u82e86gY8N
 qQJW7QlqH3faflUHq/Q==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694b84d0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=YG64nluAAAAA:20
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=itlchkg5PgSt1WyP9K8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240048

On Wed, 24 Dec 2025 at 07:28, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 23-12-25, 21:16, Dmitry Baryshkov wrote:
> > On Tue, Dec 23, 2025 at 09:18:37PM +0530, Vinod Koul wrote:
> > > On 23-12-25, 15:16, Krzysztof Kozlowski wrote:
> > > > On 23/12/2025 15:11, Vinod Koul wrote:
> > > > > On 19-12-25, 23:01, Krishna Kurapati wrote:
> > > > >> Add squelch detect parameter update for synopsys eusb2 repeater. The
> > > > >> values (indicated in basis-points) depict a percentage change with
> > > > >> respect to the nominal value.
> > > > >>
> > > > >> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > >> ---
> > > > >>  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
> > > > >>  1 file changed, 8 insertions(+)
> > > > >>
> > > > >> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > > > >> index 5bf0d6c9c025..f2afcf0e986a 100644
> > > > >> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > > > >> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > > > >> @@ -59,6 +59,14 @@ properties:
> > > > >>      minimum: 0
> > > > >>      maximum: 7
> > > > >>
> > > > >> +  qcom,squelch-detector-bp:
> > > > >> +    description:
> > > > >> +      This adjusts the voltage level for the threshold used to detect valid
> > > > >> +      high-speed data.
> > > > >> +    minimum: -6000
> > > > >
> > > > > 6000Volts, mV, can you please document the units?
> > > >
> > > >
> > > > Code is correct, the '-bp' is the unit here. Unless the suffix was
> > > > chosen incorrectly?
> > >
> > > I was hoping it will be commented in the description here.
> > > For my reference, what is bp and where is it documented ?
> >
> > Base points, 0.01%
>
> Thanks Dmitry, where is this documented for people who dont know

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml#L48

-- 
With best wishes
Dmitry

