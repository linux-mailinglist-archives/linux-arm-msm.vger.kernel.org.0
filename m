Return-Path: <linux-arm-msm+bounces-118652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YY1tL/eSVGrKngMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:25:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DF7481DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:25:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X79RIm6O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Nt+A7m8Y;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118652-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118652-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32DEA302A2FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2AD369991;
	Mon, 13 Jul 2026 07:20:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5E34752F
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:20:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927234; cv=none; b=IfiBj8eMyWR1pwQFMl+LQr2aOAyyeQErmldTWhteu3SjKdpzKsfzYrlDo3pPv+JD3YD7aN1qIaUEVZTDOGZBp5fL39C1WwRDquGA5Qdg+R9GuY/4l95I2ciXfVu3NdNDnU+vnxHf+JK9zHMbBTV9HEVub4sLRrYKma9g3GDhCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927234; c=relaxed/simple;
	bh=0Z1Bn2feo6g2YqQo4iprKdFnf3O2bNtJay3tzNauvVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl/y2n0Npx6yoIMAsdYR8AsjI8tDWYpVlnxduAO2+rlYsrnfO5F98IRLQ0hG5xwUrjCzRbs2qLtVjknlRDUW5ROy+rnuJ6Upth+ujpsD/jxDzFs8RUwEYFrG4VBtTBo2qVu12V96ELYNosJ753DfFNM41ga8NW9F6BxE6o/pSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X79RIm6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nt+A7m8Y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NiiK648382
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bNv+b9LdqbQvBVnVS9SYjw6b
	sRFXfGraMJ1uo1KKPgk=; b=X79RIm6OaM9QA7ktLcGA/Y6uOmSuBpi7vviBhrZz
	cYo+PxwwdXGPZ7izbUwd0wnOjqYHDez7wG8sVaqOSpfhEcdyksLuMGAxzSDAxXyR
	rknCi9jj8P4xEjgQ5MzjaCCFWv7k0po3Y74NLQnHL6xsOq/nuGJk0MN0cZG/Gg52
	QAvLtoXDp95jcZv+P8fKry1LlRtlu6jlbb+KM3P9Dl5PPKZUptytPIJKjXsqx4a3
	57fcPbc3QPbFWlyIQ8ZDmB2ugUz+KLVOXcMOGrCmXelAug0b0WwnV3VODxYGnaZc
	5IGlgCHc9O3iOrF/CYcqgET2Gfa9tA1ioRC3XnXJIaMqNg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4tvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:20:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso4380635a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927232; x=1784532032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNv+b9LdqbQvBVnVS9SYjw6bsRFXfGraMJ1uo1KKPgk=;
        b=Nt+A7m8Y7O/uWNMbNH7FJCaPccYXUphJjFy7xJYIVv/Iy/iJYiA64uREtEF4goVgvW
         0qi8BsK/gzXNCknq4uyq63ngHFdNDCv/Y0ijhWdazxoIe1yE7Vl4znIl+bAEyrjfaMcb
         aQ2pr4Yyw3yiDTOw8KMfd5qMnLpBjE1KwwVwUMi7AEC+Jm5poT+SBLDfj7mZNPhf8J+f
         Bm+2L6Og4nXPvSr169qL0cWRfChidjLpqI6xnWgIyhls5lcfIWCMpYu4vwX1OU0ZwwTR
         P0VqJdPhAWTIqRpNe83GkrvuAanQYiY8L8BAaWatguM7LpUT2iOuRVNapwlQcRAyFHV0
         NDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927232; x=1784532032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNv+b9LdqbQvBVnVS9SYjw6bsRFXfGraMJ1uo1KKPgk=;
        b=sfjrGYmqaMJ0G+B5j+OeNg9ZR7H4Kg8UPCwsibhNzeuA0AIEelc6fLkUOOZ++3dF9P
         ZZse/ZJdBITSSoYOcLbkeSvHFigzyNAOCMn0D+T8K6kaFZghPiucphNzyJ+p67JR0aIE
         0PSIhgX5vtzs76HAtylS9qcW5AaE9KRh06QKqI/Al7yQSSSWTnV/LCgXHM7pEs46Xr20
         Uol6sMA1Ho8cZqiW/Qr5oOT8bGFfU9FverthaDxKveL+ezGIGOmgOiOqG95T28e6UrJY
         RhWEJB0du13Vqra2BijusLGXDGVQOOsZwRlwxCIPMvlLKNPUoqcY3tw2e9wKuCYgCOmK
         +xDA==
X-Forwarded-Encrypted: i=1; AHgh+RpV+tYYKsnr3TUVG2THcAiV3p5u7KbEwrZTqpFo5dFF1+hxQHgELCEt/X6zEdOgyfWCyuBV+XNVMojM3IDQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzwXWsdewI8hK+BEjdWazZOKrbnw5/O/ZuQ3xqjCavSPJrXNWfK
	ByH1UNqi2UkVurkxqLcfuIcESeDhg3OmfNfRu02I9gzhX6g6LUICSSXpJqr4PhjCSRv0uSCYo22
	6Im014ZfFXuH882zV6XzowveMwG0dkWr2PAJK2kCCjwdL90YZ655zs2fBYpBdtGInmuQl
X-Gm-Gg: AfdE7cn3mKTKhMJkd6gX1dtfS1lOW1z9nKfhKvkYeN6WS6I5iVDc3L+YivQxTZp6Yi3
	dNeSv8HOk4cKt0xbZCUz0b4Bf9oux4hd1EBQoQK+t4qmNnGQC8S+LcKdUhmS/G4dgQYOnuOMS8s
	oFtefhkmMLN9n7sxYc5pm9GTpxzNrV2brRoF89gbx99NZH2rJ+j3BtBsewDuuiRslBg8SDqeRRz
	rHML+J5l0oI/XqPXg2Z4rbfkLVP8ryx4owzPNLgy4ODYrAzW+GIoW239IN03F/K4N0fEtDlZyzC
	BUkwTbO3yckpquO5KW6kbW7EBO2v4Lm3Cvkb9cn5S7wOTh4qwrzPyaOlaBRBZzUJnJ27QmWkK8p
	Mf+ezz5TM18ej2JqbY71ignvMptKr56nS4SOUgjSSonw+hAVzWDQt67Sna2GH
X-Received: by 2002:a05:6a21:9216:b0:3c1:c6e:9373 with SMTP id adf61e73a8af0-3c11029de1dmr8239221637.29.1783927232142;
        Mon, 13 Jul 2026 00:20:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:9216:b0:3c1:c6e:9373 with SMTP id adf61e73a8af0-3c11029de1dmr8239195637.29.1783927231737;
        Mon, 13 Jul 2026 00:20:31 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9081d5c3sm18677102c88.9.2026.07.13.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:31 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:20:29 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX8qhQ+MtOm057
 B73RTPdgsIFKFpHjP0pfet6rG/dsL/D6N8Y1wai9M6e4b84aZN+E09D9Hhba42cc/lxmfNE6qo5
 Gu8SBDbi4PDQmaysLBULcGKSkR0uTEo=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a5491c0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Us82urZKVve1r2lckrIA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: uO40NHdYycyEhFSdLlemQjT63KhFhzma
X-Proofpoint-ORIG-GUID: uO40NHdYycyEhFSdLlemQjT63KhFhzma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX7KKJ98KVOB+V
 DjiNVjTjDBK1IogBhXpZ8k8qExTwImL+bnhGQ/sakI+slVqK8QbHK8/I1gjJ4om3/ofrwdBnhkq
 Jetg4ORN/HknTpLfdzdAp40tge/MzowffRNHqHNi7l0c/uSsB0rTcCDnPbnkLQNIaFUzwq8gPBj
 WapIzly5uNYIGlvCEF53ealiMtYTxDqGaTO4tIy5hptKZ13WCXsV1A98Nw/Fz8x3NKlFY/mpKT5
 hc4D9gTZi6VOMJryIYWzduBmHtczx7xXxNXocyu2j7zxmOWSB/8oO/z9kjs0ccxckax7524BDWl
 h1cQJWwHmD7OguyrcXaMkoRlMMMqjwEUHiQAXUJPjrY7v0CALu9F0x371U3e/pqyzVyuziXizo+
 f7NONccIsgLUDqs2dl0Ov9IHPXOoVpk8yp+0gggIryPcpKRYyuA25ucRPW2SoiahZPFQ7i7Vywd
 zi9umE94IPnJdnV8Syw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118652-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,hu-petche-lv.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:Thinh.Nguyen@synopsys.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[peter.chen@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 326DF7481DF

On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
> >> And Dmitry already said this at v3.
> > 
> > And I've already responded to his comment in v3:
> > https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/
> 
> It does not change the fact that type of phy is implied by compatible,
> thus you do not get a new property.
> 
> 

For USB2 PHY, it has property "phy_type" already, it could extend support
list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
or re-use dwc3->hsphy_mode depends on where it needs to use.

diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
index 1ab134f45d67..5cbf17d493ad 100644
--- a/drivers/usb/phy/of.c
+++ b/drivers/usb/phy/of.c
@@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
 	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
 	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
 	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
+	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
 };


-- 

Thanks,
Peter Chen

