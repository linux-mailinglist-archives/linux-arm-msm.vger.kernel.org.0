Return-Path: <linux-arm-msm+bounces-112838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lIVIJlpeK2rl8AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 03:18:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF024676184
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 03:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XBu3YVp9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZM6cEeLq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112838-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112838-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 403A3314BB69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4E5335568;
	Fri, 12 Jun 2026 01:18:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FB732F75B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:18:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781227085; cv=none; b=arD/c/xb5z/srK0od1sTy5lFhipBhQDc54tsCS2H1rt3E3jN1NOB4zCvT8k9/lScOnfEJwidPHeD89KdIxhMnmjTXH3e+OW9uSYLwfJdcdHN4bd7HNcloRvUnC0c4OEDDdWYgmzcDqLWzT4rtVAQ1xmS8seShbxWdp7Om2Wg7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781227085; c=relaxed/simple;
	bh=Zuowp69okHqoeqjXee0h4XdV2JsffR3X6Im4oI1USEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsUwaPcebd40RlRk2hJ+m9WooUe9QiFzeLBoxf3mY2aKNQRc3SbTC92LYL2Y5HY+wb9YvHOWlWPuHdTm4hknpH1RWukMSDiqKR0t3P1T4v4GaNatW1VptSC7innwguXf+9QEUrGGQP981FVGS901b11xS6sYHnRWpsjKR9dSLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBu3YVp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZM6cEeLq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMUmCl1865131
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EqFMpSpAm2KuA9gUkjE2CCc
	/4B8cxyegXiUK2f5fww=; b=XBu3YVp99cQ3B1+pNoy0HhauSovp/N5ocz9wrTuE
	st0uvVVGpJC/imYHuAyuCfMWq9Y2f+YFz3tEoEE707ud5wssH40gKLpi/7K0oaAj
	ynXYaAHZBL5QkrkN/Rgme/fRnO9EAQ0rReo6w/dRP8DfcJsNObvUaSmWcoUcdzJX
	1pXAFWvtT27wqlQMz/UMHgLzWSEZVR6kWzCLllsvQIYam2/N4ENo/3UvPrXE04Ot
	PgpUQymgMW4sUc9FfTMt27QSzn7wU0o3rDYWQFR7/aWOEktvTCHmm0iZ9Fx7H/xU
	oYK7xIcTvXDJPEzw4nJIaaIDnwsCt99q2yARUQp9pcmtpw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xchekh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:18:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8613efbso668163eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781227081; x=1781831881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EqFMpSpAm2KuA9gUkjE2CCc/4B8cxyegXiUK2f5fww=;
        b=ZM6cEeLqLkQIh+NJ+1ZYTOAwTceSCeGbC9RzQ6nctkrAE4SyQZL11DNU4EMF0oNA7Z
         ZgdrfCTrP/hB6DYsl4jjne5n0qjmmaQaNE2+/nxhuemfaVoJ7KIh8cuc6ZZF1P+aL8MY
         a8cMuBIQnMDc8pAyWsPzTu57dG/4CGNNg+Y09QgwwcNVbRDvLVjEwHD1Uo0svGFxzoaH
         COA8vsCPYtPGf2Nj5M96dO4kk4O+nXvH31UmnHiTzL9tiCrF3vnGgoJHUDWGg2Lud+n3
         y/uYDJ5rCVsilBixmTUO4v66+d4Xo8FKK2ohGuwQh3doD7dpy7l0DxSPaab5+ShxvW0o
         NN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781227081; x=1781831881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EqFMpSpAm2KuA9gUkjE2CCc/4B8cxyegXiUK2f5fww=;
        b=nK1RMXQ2x37rGnH5peTQqSLglHMMld6fgdQ63OUFD8ffxn79rOSkghwviKwzFqqpZB
         biHuLRoMFLjzpqEf45OFdiA2qosnYxsM0FkfAiQeBT05H/FoabpIR/2IGZhO0hQSnnHY
         kVvMR/sdeDZG0rXBHgeRb11Tjh85QLrl01lYtw3zmhEkV7+nPC1VDuGDDcnBAicrVnKS
         2SNa4cNIlqjDps5GwwIz5XK/cXlpdq7QLZYANWGjJNsdgE8zLUDbWoGrx7YwNw7lwKlN
         SJRSYuMKzm7dU7X/iSl/xEeq34sBUo8nQye2wQpzGtS4qvaEOOnaB5GOwnyEfqOgVc7y
         QCjg==
X-Forwarded-Encrypted: i=1; AFNElJ/T4svQMIOhzrrF2HRgYJiQstgrvoSbD1FP+hewZDiY0/l/qnXRHKHx8U39wAqM0Ac51wIkZcwrQswovOae@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm8BgdH1eACn1gkOYBw9cOn5MKAAbCXq4zbNvnL4wnoVDJ9dXB
	o7gPV+SQMkaymtLvovAsnyyDuERWU9thUOzQOPyyh3rjh+WCLmLmZu0ja9GPGRNKpEZyL+ufPDj
	H8SCxfNLyZMPdt8pmt5UP3D3e3RECbcncp6Dx3r+J2KukI3k1nxqjanFyRXKQtz/ZVB28
X-Gm-Gg: Acq92OEL56SVLnDFcOgGWokzwzQMuFv5B68m2xrscgqQrbylWzeG5rh8M1zs0hYJheF
	h9otvovWuPtOxTu8ppGgpjto/IpUpH3V70OVEjIXt8bTnkK/csl6xto0/EgoCGaL5w3FK0iMt2h
	I13WlJlygPYrqFyovrg63CxUhkOOLb3AJ2Pnt9sWgHilLXhP4XF5+FCzYL4+ubPbBv9R5XfVmy8
	1Dh7ABXsfNmoWzXEskwKt8wyDNfudjLC2Nn3GZfoSTRLx3s32DXN2J99T/9fv6D+wtIzdlsNyTC
	16zTZpL0QLiR4TVDTd4h0ZN/y5+czMQYrBUH91/OBv8IkUJgrjtR7Ket/T0ipTwA2lvszuKl7dg
	kHaXoCTPAKLGzpPtO/e+6EDuppvj9KE8bmL6l+8vX+mqtmAgyMjkgk9sELtiQY9mOy1o1Cx8G4Y
	FzdA==
X-Received: by 2002:a05:7300:3c2c:b0:304:8361:a87e with SMTP id 5a478bee46e88-308200c5969mr426756eec.33.1781227080818;
        Thu, 11 Jun 2026 18:18:00 -0700 (PDT)
X-Received: by 2002:a05:7300:3c2c:b0:304:8361:a87e with SMTP id 5a478bee46e88-308200c5969mr426735eec.33.1781227080168;
        Thu, 11 Jun 2026 18:18:00 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5fefecsm1203063eec.13.2026.06.11.18.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 18:17:59 -0700 (PDT)
Date: Thu, 11 Jun 2026 18:17:57 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
 <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwOSBTYWx0ZWRfX74c3S8poBJq/
 Jf3+1O1qbuUFF5qJlMIx6Hj+r0U0FvqlkxzcqtsizkPzhfEq8qBSWoprRaJ/hJZB1253Yhqur7K
 YsWZVUC5oa6XNX6u7qCap/D3a5GM/zjgHGsOB4fZ29/8P3EgQQMfGbjmD02zNT//yq5pMrfUrIk
 RlJRzbGlMcXw989CHMS6EaG84VGoPC6JY/bB+QNP/C7yGzv18W1rwwP4SaSPtw06EAqfHYcuJoG
 KDlcuD5ZpTMqlqf2/OL/g53lIhNHwZ/q7YAEEP6AjSoQDAD6D0Bp6oc48SGGGQtIIc1vDA8RK5l
 TAVkFZuXbkDeD5jgDfNMkIy19WKU4JFDFWWM2STOpyN6IhHEJWCz5j3HfDfW00wqQ5SnUwxvh53
 hI4tNQZDOaJkuk46hzq16+NF06pQkleawLW4A78bIcJQyqFax8/o/4vQHuTVo3avNQWUsKwOHre
 XAS6bJdmgLfFldl0gVA==
X-Proofpoint-GUID: 8O27Up-rehI_te3aOC8lvEaHQD16o_0L
X-Proofpoint-ORIG-GUID: 8O27Up-rehI_te3aOC8lvEaHQD16o_0L
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b5e49 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=k8qvQEqTjxYPBieS1nsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwOSBTYWx0ZWRfX45jDjwGpcE6s
 XQk8NbEwNQUgKBt5eUT+2T5N5ZPdP2DV0Gx3o4D8WNNauWVUwqrYmlRA0EOO2YJkkxpLLR54f3c
 A3uTN6BmisjtB4RbvQFBRneSOtjm6cw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112838-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mattleun-lv.qualcomm.com:mid];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF024676184

On Sun, Jun 07, 2026 at 11:01:10PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> > Add a dedicated schema for the PCIe controllers found on the Hawi
> > platform.
> > 
> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
> >  1 file changed, 204 insertions(+)
> > 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interconnect/qcom,icc.h>
> > +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> 
> Stop referencing clocks and interconnect header files. Replace used nocs
> with ephemeral values.
> 
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> 
> Not looking around should be a sin. Take a look at other Qualcomm PCIe
> bindings. Compare them to yours. Then fix yours to follow.
> 
> Hint: the extra soc node is useless. This is just an example, so use the
> default, 1 cells for address and size.

Thank you for the feedback. This new binding follows the examples set in
the qcom,pcie-sm8x50 bindings and retains the same formatting (extra soc
node and header references).

I understand the example can be simplified with your suggestions but
want additional confirmation that these will be the convention for new
bindings going forward.

> 
> > +
> > +        pcie@1c00000 {
> > +            compatible = "qcom,hawi-pcie";
> > +            reg = <0 0x01c00000 0 0x3000>,
> > +                  <0 0x40000000 0 0xf1d>,
> > +                  <0 0x40000f20 0 0xa8>,
> > +                  <0 0x40001000 0 0x1000>,
> > +                  <0 0x40100000 0 0x100000>;
> > +            reg-names = "parf", "dbi", "elbi", "atu", "config";
> > +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
> > +
> > +            bus-range = <0x00 0xff>;
> > +            device_type = "pci";
> > +            linux,pci-domain = <0>;
> > +            num-lanes = <2>;
> > +
> > +            #address-cells = <3>;
> > +            #size-cells = <2>;
> > +
> > +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> 
> <&gcc_pcie_0_aux_clk>, etc.
> 
> > +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> > +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> > +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> > +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> > +                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> > +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> 
> -- 
> With best wishes
> Dmitry

