Return-Path: <linux-arm-msm+bounces-93977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPr8MteRnWlKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:56:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA1186A67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25A1D302529D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD23A37F8B8;
	Tue, 24 Feb 2026 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaB3VGEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfV37hVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E33803EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933927; cv=none; b=m5rMtx8S/AqUm4ts5UT4BSHQ6H8R4ZST0G8XUV63kgH/y5Ri96Ce22TBjn8AcExkkWWFDcQ3e9ZOrm55j01ki/rzWcL4Xbc/Eh49BObnGdrcJJC4LRjXUXpLMo0/RFxiSl2HeqoCEryazuezD0TU5lVo9TbCEtUhBtuyQSqrdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933927; c=relaxed/simple;
	bh=t2PDruC7elzjUKHs6mTF0Zfkfl27z6kKCKjiRIRKPBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArWOHbXj3DsTTUB0bJdf6MPot1/wZAv4N8bd1vVZFK4PUu0XhPQ0m0A+3UVtd7FhlUophU9DM3AZwKTAJ9pUsOqqg1OY9+4W1259x3+l6TlBNsLlWjyvcwp6zS7wnLbOsS9O7X0bXItWkpqZtBVD4oQ962hpqgjAMcquE54F+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaB3VGEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfV37hVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFYhd057305
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yb0i4w564/iHf2Ws4pYqL/Fu
	4x9UFMFGj2EhrHPEPrs=; b=PaB3VGEIylLDOX6R0FCDonrWjutfawvHujCWnurh
	znLe+QoOrl3EXpvQsqN8AEzHBACSWI+csabNFbJfOqexHvQBOgVjHw6xZ9++FycP
	C2qEiO+jQZQ5/SkMIjtiQl8qr0xG0O+jcd2DLIE0D6iktWI3UIsydZ2lw2eGb/z3
	SMYcFE7Vlv/MxyQYT5rg8KP0uGc56LhecYjtzlBfs1dn3Z61WFGYzjQ5WbkvoyDE
	3wW+2wq3G/uunuWxmN8zcxcfqa+UblpovQ33l9A7GQgSemSy0oEDJraQRkofDQu7
	x6quqZsZ6ZMDM48HtQ+pCcYPb1AIcTAanV0Pv7ZNrBQ+CA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sa89he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:52:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so4514072585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771933925; x=1772538725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb0i4w564/iHf2Ws4pYqL/Fu4x9UFMFGj2EhrHPEPrs=;
        b=QfV37hVE4wS6ZLvTzfg+GnOnclpzOADA81vbi5wF3aC9aet7d3R+abuvpiq3zr68wr
         5LSt7ZIuP+KgzZrw56UglT8wPXx6teN7xvdJWIfTAieNC/pUKCSaF9gsL2csl+BzlL1h
         Dy7atlLs+Zp/n6MqlHtuKEaHcs7CdkZsYOHitBB+HuSBQOOS1vArYBlClVNeLJ8z9E9n
         +Bu1Wexkp4hILhum4FKIgIBUIp/lwui/NrSAfPvrvNkYnYlPqYRxL68q5aECWPNXlLrd
         l6cvHb3Gkh4181alHXuzBSwMEauH00G9BONIwrdUAr9gIYbvUmABXyC7NsXvAzrxjOEq
         LVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933925; x=1772538725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yb0i4w564/iHf2Ws4pYqL/Fu4x9UFMFGj2EhrHPEPrs=;
        b=gwqYl76CXH9eA1nq+piAB5xunn7Gba5Gi1KEySkDfTTkXlcles9ieBxYJDaepXckMv
         CdrfZWKhJVbTJHIVyzfHyerjfo/50cF2PvaaPJBLQyl5EYFJs+2lQybRQZiCfReSxuul
         0n1ZfamS0aHPdZR+Bvv43bltio+Bc2TL7TBCGi1qJHR9xnBubZiKg1j+MvZuYtgxJ3Xb
         B9gjQNdr7YMddiB6PmoFvYcvq6lqrxjOqghI3+ur9I24KGbAjgLKVGb53oagZLtu/aas
         iTvcaBLSmpItWyrKFXfoImsdF8ZNlVFKk/o9OSR0pe6ofkgLZA9wayBU4xvRmafZH7GU
         sv4w==
X-Forwarded-Encrypted: i=1; AJvYcCXjfQBgtKDE5eoTkenPCJY0IEu9++t20prAisVv6BqQezxU8bTLB8CYBUAScMCJ4JxzOftr6B31r7WfUuEp@vger.kernel.org
X-Gm-Message-State: AOJu0YzHgCUZnDmkJhbRDV0k4uBj6V8Jferj/snD3seAgqhA+xKPM9h9
	ePDHJJFPocmLavuliG1qmHH6ckyK3MoraTQE0lR+SgZ79tgMGnRB3X7NpN0jpgcyIx1hPuZzdB5
	/KmSEWj7LZgjS+yBuCoSHzh+jz5VkU6I8bhuzegKePwFKFaFBAVtzvnaFaEkD/1jkcySo
X-Gm-Gg: AZuq6aK2lLlAFRbalr/7zFSky0bxSxoW154uezMeCO6+szRDLP0OUSPXi5fEhpVl7Nc
	KHICojOLQKahfifDst0Spi4FClLtOPM/ixLJWsXoWHeZGDWWIDgRtyLuEB4L9Sd3D8hqWUKgDey
	IxJdMHmvXO51D+QegwJ98ikDmAnMgrVt5UedJPXqcAFHwsAQB34QEfbju9or96nt5SE9bbshZQZ
	TwWDLpe2/BLdhHp2sVMAMYfxLjDqWdY9yVWyH2iTjTVWGRtlkplD/aq4/V+oUXI+uFKD+0tMs2H
	1zPHEDO979Pm4hCy8cTvGp4aKkPfC8cqWVWwNY2azx43bVcGFJ13GDPlr0u/NluUAk+qzVwhiek
	OqpMk9x12Md+KC/CHmMRLG62Kn3bu79fJjzDu
X-Received: by 2002:a05:620a:f04:b0:8ca:305b:748e with SMTP id af79cd13be357-8cb8ca769c1mr1701824885a.57.1771933924868;
        Tue, 24 Feb 2026 03:52:04 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:8ca:305b:748e with SMTP id af79cd13be357-8cb8ca769c1mr1701820085a.57.1771933924255;
        Tue, 24 Feb 2026 03:52:04 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm28004908f8f.22.2026.02.24.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:52:03 -0800 (PST)
Date: Tue, 24 Feb 2026 13:52:02 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH RFT v2 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Message-ID: <aa3gn6iubvv6n44irrssxxywhvilvywrxaoigmgw26vdjmujmz@asnn7cwrn62p>
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
 <20260223-dts-qcom-glymur-add-usb-support-v2-1-f4e0f38db21d@oss.qualcomm.com>
 <8a2db0f2-c9f5-474f-afcc-53248da19297@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a2db0f2-c9f5-474f-afcc-53248da19297@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5NSBTYWx0ZWRfX/7wobBEVSH+d
 X0SpSxmZhlOz6VSWqiuaHKjzsL9Q/kdm96Z+tYdAcohom2MVFC96/9+4Ot897ut+4B20FnMS5+G
 YBRwAH4vftKf3hNUvHMwZXZzzLrPiTOaZdB/FBCeyJcOLyF5RtOt/v/6Pbm7Awg1Rlup0fHSc9T
 9Io/4+UYPkSJVdPyV5SfVkXXH2gd9SdIa//bSwnHxiMnVPKC4JTcMJEThR4od0ChTMQBfwHh/+a
 /HXajNPK8Upwzp/LWl1NfS7ON6oGnqTt4MYitpdj39kptFezYhRP+9DfBD7CsP4RuhGPrpqnaZt
 /TmyXHrvhPr4CwUn1WwHBeNyylelB14nELpZ4+rz/oIkmTnfLD08dB3R5ecvuMZKx+d5bBomSus
 94fvSOScEYTqAqRp1CtnRPOxrEpqDnDJpU58aGFrmyO9SW8xBPf3rw4TkisBu/wrG5G7pWcXAol
 gUlWMh7oqKDtldifjfw==
X-Proofpoint-ORIG-GUID: j4QQHkq8KAeq_EolLP67kSDo2mZIKB6f
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699d90e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ktuAATloqCpIEK87szYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: j4QQHkq8KAeq_EolLP67kSDo2mZIKB6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38DA1186A67
X-Rspamd-Action: no action

On 26-02-24 12:46:43, Konrad Dybcio wrote:
> On 2/23/26 4:37 PM, Abel Vesa wrote:
> > Some of the controllers found of these platforms can be tied up to a
> > single high-speed PHY, basically rendering them as USB 2.0 controllers.
> > So in this case, the interrupt to the Synopsys DesignWare Core is coming
> > from the high-speed PHY, so allow the interrupt to reflect that.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 7d784a648b7d..f879e2e104c4 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -500,7 +500,7 @@ allOf:
> >              - const: pwr_event
> >              - const: dp_hs_phy_irq
> >              - const: dm_hs_phy_irq
> > -            - const: ss_phy_irq
> > +            - enum: [hs_phy_irq, ss_phy_irq]
> 
> Since you're tracking this change, after it lands, could you please fix up hamoa
> (SPI 243) and milos (AFAICT SPI 349) too?

Sure thing.

