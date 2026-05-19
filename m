Return-Path: <linux-arm-msm+bounces-108407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN/IAx4kDGroXAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:49:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2F57A7C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59FD63017BC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FE93E558C;
	Tue, 19 May 2026 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVfZs8cJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkFCp6+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C83E316B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180158; cv=none; b=V4kN1JjkUI4f/G1WGWzy6ajzOEd5yTPS+ov2awiseS2pn8OpvPdkjFlGcsYD8kY2L4E+uZVhowrccRkC1TWnfQF/XDevoxoqDPfox6qn7T9iGbjUFxHEix6XXneR2Kkn7UtkRP97XSNZ3en3DDfLu3LK4Mvtd+g/QxsjgKRj/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180158; c=relaxed/simple;
	bh=0m2b/SksJcOAFPjMQPTWeZcO/lplBz+CZOC1BuzElpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoKI/g8m8r2QclMz4OPhwKs4CxjogY5QGrk6ae0L4DIzWoTFZ07UQCwLZ2XkGJBqiHH4Vb4ghrM7SMLcS5VwD+37Hm1PvRx6hYqndwr/N5BAIebZ9lvzZe6GujZCSYJBImZ+ZNY7j5oQSGikZgP1z5vUl3NnHI3jubnrCZhL8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVfZs8cJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkFCp6+W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EEWi3612431
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kv7IMgrAnrqVIrZvkc8Dgwy+Yh+GluIWmluC1cHmISQ=; b=bVfZs8cJ8RmdGXrH
	oph0ED/BLqIJjiY7JtZzhi9yoO5NaW1fmQKhwTIEGIj/htqUK0NwcTuGkkSq1EvW
	3AlyZB8gtVAQ/mvrTxfnJ/ihQQqFLXqs8LOLd7mSCrFqjd2vNjqRFaTc3V5gZI20
	q6v3Xy2fh45ceXB0Kwvmj46Q1Bj1Abx1QxT38XqusSDb4i36O3aT5mPaedtw8V5o
	EgQXpJlkkCZa6Tdn1/bbCuTeGnjT7wGf8ZYuFX2oT03O1uO5LbZdk5r81zO3kBjT
	t+5dZKypZZV4vvSYEn2PiVd4MPkODdWbsN810czL2CpuzZZMXAvgqouzbKVfkfWd
	3FHLfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64r4cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:42:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so2756499a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180155; x=1779784955; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kv7IMgrAnrqVIrZvkc8Dgwy+Yh+GluIWmluC1cHmISQ=;
        b=AkFCp6+WMyq5BxbmlFPS9QG5t8kmQjTojS3AA+niYakv37XrzY0ATQxj/TYzxSFIqN
         vLP+RsbiCpO+y2s64w9jq1265RcusFlUxDzOeCkaK/tQIPANuxC1OTcJRC1f+x3ZrdJS
         9RgfiUmccjjvV1a9+6EEH1JKPnX+SC30rahcIPjOKQ6HtHSnruQgnnIYRKIEyv4TiafK
         4pKyZw5rFS557nDzJdTPIqsNGFr6GmOYVdouBjafbkM5azsq6lleWembqOFPt8+sBgwx
         GO2Qi5hoEDtD164z5kziX19Vx4Fjm2pI2W59jSOVNNr5VtsvDwp81/NAMIwYZKFgSPFP
         2p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180155; x=1779784955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv7IMgrAnrqVIrZvkc8Dgwy+Yh+GluIWmluC1cHmISQ=;
        b=ps+2mFMshQivh2QH18VLYDFVECK2C6E6HFaw9lx4trXwHDT67wng1aX14od22BXaf3
         6y9+zPIWiFuCP2Yq78lqp7kHdSnWdJNuc3Pvheol0fMxkDDYYQDpECLPvPj+v8fCzCwK
         ZR24Gp5cJVRwn4vL8OzpkB2C29/oLMo8UDfPhWXcvTPgkaLbwqxlZwKEp4Zi9FLn4CiW
         +EvmQLcCvD/fxSAxOCPKgsnV8ZtZJhFvlAF7uQBhLsPtYsGOeb/O6Ibfe5W8/aLyyhE5
         cSWZvO7dPJmE5wG5lQOk5TGCzVOkeCQz/GcOm+KEZC6IdJMSDNv1yoVp9eSp0/YKsSss
         FujQ==
X-Forwarded-Encrypted: i=1; AFNElJ/S+86+aoUVslW6FPlkOSWwR0I4BKNYvY+746TiR3q+SPyKfsmxAumjMfFZRxAr33ko+VuKdTXrb/fBUKja@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4m0FyfoqOzxmM6+5o+UeQdIyAWLNklzwvyJHxBuepOCZtlzN
	3DYTpXnPhJYpuREF2cY2vCNM+xEY8E1MvXKEUZqMfAY1a77AcO0LP2hw1owpoAeXlGHvBADZUtu
	iL4g1i1PoZy6Cl5Ie8XLcmXdoO7+P2nxGkNJo9WuvSqmN3CtmRj7vqRlU7pXbJnied1Q8
X-Gm-Gg: Acq92OHpn7wFaTGcOe/ak8XFVV0eS9j7W2uZSaMYRZurEKzMHjo6y27xannNb8YEaLb
	YeqSaf7UgJMwrAfG/pv9e+Tlg9zeNGC/UXg0fM3FtFM6RqsGEtDsMU36AuSXn0kEN7swXN4xAQj
	9jYylDlrAn2xiOI48vqgtc/PjOkGEcFrZx3wDk3vaTMoVF6OnDVX6L5IELSHyfcJMHbhfFi0S9L
	KCa7v3fG9xETWSZXRmZj+3J0uYiXEuaK2U/XS3rSE0kPi5AMF3dqPA+4egVQyLxTTV0ROZ5YxYE
	FoKuK38MRpcc+hHisFZByxmMKrvoQ15I1lyVq6cOQ41SOjf+/eaMi64trZDTmtycf5b8TFbIjIB
	MrpkI9m9ZJvIfTtiDF5spiQuHD/4lsGOsJkYc/ZcSdCusj+I6
X-Received: by 2002:a17:90b:3146:b0:367:f76c:4cbb with SMTP id 98e67ed59e1d1-36951b97b5dmr19072853a91.18.1779180154995;
        Tue, 19 May 2026 01:42:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3146:b0:367:f76c:4cbb with SMTP id 98e67ed59e1d1-36951b97b5dmr19072809a91.18.1779180154335;
        Tue, 19 May 2026 01:42:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c4bb4d4dsm3055289a91.1.2026.05.19.01.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:42:34 -0700 (PDT)
Date: Tue, 19 May 2026 14:12:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
Message-ID: <20260519084227.pfkasblfliqyxqxx@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
 <CAL_JsqJJ9ma2wTwyrV6AmkGULJk7YMU6qm3Guj+jC0t_-hfV+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJJ9ma2wTwyrV6AmkGULJk7YMU6qm3Guj+jC0t_-hfV+g@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NCBTYWx0ZWRfX+kFyS0Iv7ek4
 3kSuweiyiAjdnzunhaCXkIjbAajYnApgwTclLA6oNNwe84NXeP2Iy535HWZulkur1PH+qPvANs7
 sp5/HFE2rrliYYjwcFjmDGRPI7mW6Z5GRFPrIP/1L0R+V0H3tpBd3xFEAAnOJ2BCvZgiOFPyn48
 B7SO45l0PkO4eO6KZjeTQK8CjT44PjS47t50RtOP2Y5BF7aecaIKpZ4eLc/UuriaRdEyaMHSYxq
 RPC81VNhL0WjjptRxhOk1TxVohG+eNtJLLSLKEgalbKjiWOpbh+fVWr51aU6Bsj6tVZ9uq8s0Y5
 gByFhHGlAEyTJMgt6CTyauwJa07hytrP25MEQZtNrM19jso3W3E7O2kHr/OvaTPLxIk9c6MbIME
 WNGyKxXddF4CHJgdqUCwdAkPNdpYAfqKsNGuS5jS3oV6MwJXMZ+7qWJJTW3TLbBGu/8v2MdhtdE
 D/LR1f5K4egMrudwKQg==
X-Proofpoint-GUID: 8jPduejqrnLEzvKFmV17W-7iCdSR06bb
X-Proofpoint-ORIG-GUID: 8jPduejqrnLEzvKFmV17W-7iCdSR06bb
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c227c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HagyCSpqj1WAloSUK8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.223.255.192:email,1c:email];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108407-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 79F2F57A7C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 08, 2026 at 07:07:14AM -0500, Rob Herring wrote:
> On Thu, May 7, 2026 at 3:07 AM Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> >
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> >  to deliver it (USB upload to a host, or save to local storage).
> >
> > Add 'sram' and 'sram-names' properties to the SCM binding to describe
> > a region in always-on SRAM where the minidump download destination
> > value could be written. Boot firmware reads it before DDR is initialised
> > on a warm reset to decide where to store the minidump either to host
> > PC or to on device storage.
> >
> > Most of the Qualcomm SoC supporting minidump supports this, added the
> > kaanapali SoC for now.
> >
> > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index 7918d31f58b4..6813081fd74a 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -127,6 +127,22 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >
> > +  sram:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Drop. This is a common property though we need to create a common definition.

Did you mean to just drop ref for now? And common definition could be followed later or
create one as part of the series.

> 
> > +    description:
> > +      Phandle to a region in always-on SRAM used to store the download
> > +      mode value for boot firmware to read before DDR is initialised on
> > +      the next warm reset.
> > +    maxItems: 1
> > +
> > +  sram-names:
> > +    items:
> > +      - const: minidump
> 
> You don't need -names with 1 entry and sram-names is not a common property.

Will drop it.

> > +
> > +dependencies:
> > +  sram: [ sram-names ]
> > +  sram-names: [ sram ]
> > +
> >  allOf:
> >    # Clocks
> >    - if:
> > @@ -229,6 +245,18 @@ allOf:
> >        properties:
> >          memory-region: false
> >
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - qcom,scm-kaanapali
> > +    then:
> > +      properties:
> > +        sram: false
> > +        sram-names: false
> > +
> >  required:
> >    - compatible
> >
> > @@ -247,3 +275,32 @@ examples:
> >              clock-names = "core", "bus", "iface";
> >          };
> >      };
> > +
> > +  - |
> > +    /* kaanapali — minidump SRAM */
> > +    / {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        sram@14680000 {
> > +            compatible = "qcom,kaanapali-imem", "mmio-sram";
> > +            reg = <0x0 0x14680000 0x0 0x1000>;
> > +            ranges = <0x0 0x0 0x14680000 0x1000>;
> > +            no-memory-wc;
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +
> > +            minidump_config: minidump-config@1c {
> > +                reg = <0x1c 0x4>;
> > +            };
> > +        };
> 
> You don't need providers in examples. Really, don't need a whole other
> example for 1 added property.

Sure, will drop it.

> 
> > +
> > +        firmware {
> > +            scm {
> > +                compatible = "qcom,scm-kaanapali", "qcom,scm";
> > +                sram = <&minidump_config>;
> > +                sram-names = "minidump";
> > +                #reset-cells = <1>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.53.0
> >

-- 
-Mukesh Ojha

