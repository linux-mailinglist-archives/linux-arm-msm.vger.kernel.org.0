Return-Path: <linux-arm-msm+bounces-108408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAhLKP0iDGpqXAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:44:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C1B57A65E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AE29303DD02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551A53E8326;
	Tue, 19 May 2026 08:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c09MsG9z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMQKz13m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F693E63AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180235; cv=none; b=HwOUbABRWWhFhS5Vy6TfMLegTpjDZcAd+VJp06UBrKlHM8lsTZKQP7JZ1vvM2bOyW+Ny3muSSSuDKaWxY0uDWfB3s5MMZq8jfcW9Dl7sGr5jhh+ySdCk/e91ISI9rl5TsrvfFUoe39O2u3c6BLke/jQDmxozbyZdcZlwOGG2gwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180235; c=relaxed/simple;
	bh=ML8Ctl/JCwpkRJcz+9uLrMFDdrS06nzomOLqlqMrF2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+zO9C4ZNE4qddSrxj5vhSgMvT68gxkeXi52SjSZ66iWk3OrjwkG6HntQsfi/MwrcOxI4KTAch5vbd1fanaf6iwU6N1K9UeSsljE0cbpDvude5aPW0EoNdT1Ld8ztmTHRP2Pro1Vu45OcIZLwvfYXu3JJZubSdwJTF+mKa34e/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c09MsG9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMQKz13m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5a7Z9867004
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Fvqj985nSMOY/viawN0/qJe1y6pa0P2ETL6bY1gUxo=; b=c09MsG9zdsLarGZ5
	83aumy8Edmlu/NUfIY9inIvDjzDLw4WnkIQh3LmjkUrDHY43/aCMngA+1bbKVdy3
	PFLZy4WyDSus1UPaWiYowgLPC/4YKJT8NR4m8ANKJCFeXtefb1yIR06dSniZe2OT
	y828zTZdJ73BzQhf09jZ+UW9BuhI2J5iFxP/gUXgaTqrfyhzwdSe5CGRlZrXhKJV
	D1Gcsr/YNtKDL2PK5jeWV6lSgcD/oqaN4NK2PP011vyQo6I8B9nynyKFdcLFNl0c
	vIFlWNdRaCzqkv+2LhK+sABdKADBZK1sF9uaJBtZArS2FXxGXb371CG+39X/PkYL
	GwAbOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1gskc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:43:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba838d3fa4so33252665ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180228; x=1779785028; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Fvqj985nSMOY/viawN0/qJe1y6pa0P2ETL6bY1gUxo=;
        b=bMQKz13m2Jjyx9O3MIUV0dHo6ckwAFXAX9fod9WeclZQst4ewJn6cIySw9u1UrIiv5
         CzFmO5BSb2VSRP09U5NTiy6c+hoyTnz6fvjmYKmlPrbI9ciWK2/l79MYTbM8rAH7D1xS
         C8CLgnz9GEaIfdhF47gXk6lxjb75xDaKzm5qH8f2YVseDX3cyFcUW/flkTTnGrBOYI5H
         /Xc42RieqsAxdHyMwJjBdo+9d6+GYPFs2cpYpYqgoMET6fTe8ryFDii1NGRzl5/sVZXd
         xkh2cYnoz4BsjvMNMt2GGnxoh8szLVPQtn+e7+BK+551Yv7P8e8lJo9XOnEhN8YghpqK
         lNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180228; x=1779785028;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Fvqj985nSMOY/viawN0/qJe1y6pa0P2ETL6bY1gUxo=;
        b=qmxknHbTCGUh5SiH88UTBRUBRU4DTt/1rd227BFY3dboXSDj+HcFecKeNQJCE00Z9h
         d96rJqbs0cnb7txYlx9WzBrWOQ64z3KT6tT722pr6e5hEoTqOVTjtywCI67u5V7b50kx
         xNSREjFmvUL9G1+wFEs86G53Fy5V64YKngle/YfWnkQHw8hEyuTBoZeY5vFVMSIeEZgS
         L3YldpaNeOwtvq9CllRq2GwvCt2THMNZtUBBgRF0cQdja4beq+kIYT7Y/k+m/g/zbFHl
         z0wFsSmxGKzb7BIdB+fgq69JQxMuBKTy0pyW7FypwyNQ6yX9VLiiZJQNa8i3MCc4TAnF
         lBgA==
X-Forwarded-Encrypted: i=1; AFNElJ+eVs5pDc76IcFgXK3tbSWL0SekiRugnC5bzB7gvUneHEoKFM+6axfBopSG1nvrV2rVof+2xqxmJFO/t37H@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmLJKD1XB1BiFfjQw8Rg+mMNlvc5lEfyBCKXBQRde9RJChdVV
	QMvO2WJmsuIWglfA12plSrpJ3+2axyH4Mqmwf9oRBIJHWC0tkIO8jnjq1rd+qsVxmZrKpXnfjQj
	WsNLe1zbEAZioqYOMwOKJwQTQA0+w8P3cDSviC2I4uo8MAYHWaISSGdwqp9pdeoIiLihR
X-Gm-Gg: Acq92OEPNheiC4mVVrU43iyf/ocWK3EGpBsUGoQUuA610Kwya35WxEaIH/EkvYl1IPv
	JXTSxozJnv8RLIJJ93qKomrMpwf/YYwuxR/hynNpqYnD9hJRpRoCv3tSb9+cdVIobBtwPgUOp8A
	T0FT7F9PD+WBk66uc0nhHmqSc1rG+We06KemgWWkkinAHxi7SPfg9g1lZYNdc9Rs4W4DYqxLWsL
	CDO4xf9YslEVTkQ3IuTlDFX2eMEChwyEazJ3guuH0ucSTNsTJ+186KpVnsVSGG8vWJrX9G9Vgn+
	VFx8dsnpoptoLxeUOorT4eyUne3ErLeEzGdohGNG4j+YR17c8u5H34n467+NzlIKMNu4TzgPDKN
	Cy52+ZI0y5fbUpKKuIBaEkrxrOQIYy6uLBh5yH7Q5PzqFR++G
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr134007105ad.1.1779180227958;
        Tue, 19 May 2026 01:43:47 -0700 (PDT)
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr134006875ad.1.1779180227348;
        Tue, 19 May 2026 01:43:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11cbdesm178173755ad.71.2026.05.19.01.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:43:47 -0700 (PDT)
Date: Tue, 19 May 2026 14:13:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
Message-ID: <20260519084340.x7tdie5uahaxldbn@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
 <c0def708-4d95-4398-8a20-8d4a7533fcf1@oss.qualcomm.com>
 <CAL_JsqJNn=k64unun=k+3FOem74x452WuXKS7fZCL0Vxmcy9Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJNn=k64unun=k+3FOem74x452WuXKS7fZCL0Vxmcy9Uw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NCBTYWx0ZWRfX1l2zfFav3SGi
 9r08VGmfEkEw8U/brDL7QlpIpa2LoZw8WEPBCFotam/RkNOcN7zCbiF1/EqgTbls+JbLd6ZTtJU
 G3mQO/prgPLZ478d6MX+ns1ugA6opRli/AYspU/mDXda1i2rC/fNkSIOJQQ7IEBlL0FOojarX9+
 szDAiGxztHATlIA2Jq2WV4eD2AJMlJNAaTDugBnLX8kKE6nG0fllemhbSd5lFe7TxRIac5qJE4f
 CugcxVyTLkeCISJXyns6w601N1wpomEx3tbADvm3ZLHzzlZG07WMwCpF8HoT2A58WjDSmuIi86q
 n+/1emi7ZwjDz/t4kTTUcVsnLhEAv9X29MNcrZ1nkQFtdGHeHTsU8yfmw21KCMb1HOEfiSL2/Td
 TaQYzvslnK/Vc5OkVrSEcJMnlh6IwjnholzkOLVNb91hA3OpzkmZg9R7a0PhBMgP2jfVpUn+AXB
 rk6JYwDPU6h8LDmaS2w==
X-Proofpoint-GUID: lS5xA6fLXaPfApmDgMR7NVvM7WIdY1MB
X-Proofpoint-ORIG-GUID: lS5xA6fLXaPfApmDgMR7NVvM7WIdY1MB
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c22c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rnkpo5U1iQQg37PeS5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108408-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31C1B57A65E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 08, 2026 at 07:09:50AM -0500, Rob Herring wrote:
> On Fri, May 8, 2026 at 5:50 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> > > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > > SRAM is shared between the kernel and boot firmware. Before DDR is
> > > initialised on the warm reset following a crash, firmware reads this
> > > word to decide if minidump is enabled and collect a minidump and where
> > >  to deliver it (USB upload to a host, or save to local storage).
> > >
> > > Add 'sram' and 'sram-names' properties to the SCM binding to describe
> > > a region in always-on SRAM where the minidump download destination
> > > value could be written. Boot firmware reads it before DDR is initialised
> > > on a warm reset to decide where to store the minidump either to host
> > > PC or to on device storage.
> > >
> > > Most of the Qualcomm SoC supporting minidump supports this, added the
> > > kaanapali SoC for now.
> > >
> > > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > index 7918d31f58b4..6813081fd74a 100644
> > > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > > @@ -127,6 +127,22 @@ properties:
> > >            - description: offset of the download mode control register
> > >      description: TCSR hardware block
> > >
> > > +  sram:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description:
> > > +      Phandle to a region in always-on SRAM used to store the download
> > > +      mode value for boot firmware to read before DDR is initialised on
> > > +      the next warm reset.
> > > +    maxItems: 1
> > > +
> > > +  sram-names:
> > > +    items:
> > > +      - const: minidump
> > > +
> > > +dependencies:
> > > +  sram: [ sram-names ]
> > > +  sram-names: [ sram ]
> > > +
> > >  allOf:
> > >    # Clocks
> > >    - if:
> > > @@ -229,6 +245,18 @@ allOf:
> > >        properties:
> > >          memory-region: false
> > >
> > > +  - if:
> > > +      not:
> > > +        properties:
> > > +          compatible:
> > > +            contains:
> > > +              enum:
> > > +                - qcom,scm-kaanapali
> >
> > This list will grow super large - like mentioned in the commit message,
> > to list almost all platforms.. I don't know if it makes sense to limit
> > this. Krzysztof/Rob?
> 
> Probably not. If sram is not valid for a platform, you'd have to go
> out of your way to first add it and to have any effect if you did.
>

Sure, will remove restriction.

> Rob

-- 
-Mukesh Ojha

