Return-Path: <linux-arm-msm+bounces-95489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMPDEI/5qGnVzwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 04:33:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C020A8ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 04:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77EDA30439CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 03:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32D61EEA49;
	Thu,  5 Mar 2026 03:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o38A+qH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/V5ArdB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212972621
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 03:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681603; cv=none; b=DP+Blpsb4mm9YaWVnSrnMwi4hm4uYf1xghVc/8jJgwzlskyBckzGDLrwB6e9QuFqQWE6g0ypgCijN+cG7QsgV6xQ9cFAvDMByZaFrJzPGn78E7Vl9PrIQQJByt9qnF4L4BA6sCIgcSvnIjP1Gl6qedeDh4e7wTHa+cpkiEv7lTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681603; c=relaxed/simple;
	bh=cIahUaIbGQDw0acEwfY4xZO7Ltd3QgQaB7V/iwAk9E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJwWS2mL9XngYWnTvFks4BFuQBzvR7QwP0TSCsThwtT+Pu1lY6GFVIaY+pFvZxFBOCH06X+JUBotd1IdU8IFHqwzQ9sFUM7MDetLtbatNloweui2QJrFjKs/mBwloqc9/o3RuqBITJjBXOt0l+HCeE0AiD4Y12PnI0iYCnsh3X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o38A+qH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/V5ArdB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253A7o4864920
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 03:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PyP3Y+1F9PT+kk/ROvpwez7s
	vdDMe9wKcbVyRbqm7Uo=; b=o38A+qH5OcCfacTL9IKv4s9zDLMYtfPDGQ+juVUz
	HP6kn8EkQxT8deL0BOyAqCGwlpcXi+5R1qoJjXWWyvtDymKClwmy/oqfwtu0XIp/
	2hRdwOiY/n66waZKmPx+U71fQwhbbBHw50a2hB2b4BCQHG0xiIQ/qo61eBUSAqXJ
	WtHD6UJfKak7xyPeGIAuWN1ocIZ1Q33HuR8GnF8owl5ujroG/AeboTYxGZSrlscv
	q0tL4pC8nXz0LBGhEPzTBHM2sdxsXxuKVLMpH1+igZq9T920oco8MLORgSe0Xthm
	58yfLwGhsqMdlS+HsDFqK/Zv1wjOuYvgq0+DY1QETytilw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk024w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 03:33:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3d11b913so4517153385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 19:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772681600; x=1773286400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PyP3Y+1F9PT+kk/ROvpwez7svdDMe9wKcbVyRbqm7Uo=;
        b=Z/V5ArdBwpWC82idVWczlWY/GfeBOXIPXeCQ/lICW9S/mBOhoGvi1hNzA871VxDfyS
         QOk7/aQaK+DD/QAvNFNBcavajHALmo6/8x62ykLH1HQ+WdUdrIW+cQkSnQeFwRdluPr0
         XgupQR24411CkQMmegjFOcNuxJqrlBSEgQ6uipSz6fmZgJakuahQPxnTHBLbJGrsBJu9
         k7IhlZXHQO7uu/DmAH8uDW/j9XBq2/cREj5+LbJQJ062qnVaa1Kp5WWoZ5m64yq5gX60
         7Fe+1b5qLWP+Myymuw1zuugULNXIzDNl5/7B7csNBIodDlyf9Bugj62Xpc1spm3zGdmu
         Pdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681600; x=1773286400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyP3Y+1F9PT+kk/ROvpwez7svdDMe9wKcbVyRbqm7Uo=;
        b=wMMUiD8a8Nr6sG5PTAEeBGMPJaoz/6z/U4SQH5Cqomy4LAVX1lBXHdiw1ULWh5iPgG
         2Z+ZY6Pu7w/m/XYJxavWbsTx1kc8mYd4nm4lVsShuxjx4mJDONz8d2pjf8TMIcGTECIl
         YxgQAj5GNAJpKZ5TSPt+U1fNtUUckPW4hzrqptSdSntmaDLd/fG728DltJAfafpsrS6F
         wiEXLMBNtdzFTsjiWnCQdda0bXiS3LcdgpauBPMh1AaxbQZ2QyWdYThJSiVSLKPk1lW/
         n8e/G+u+bNVjLCtOmp0bAOOUDBZHR8Lm2rhH9pO7yFQ+xkzLkFFMYa8yj391yI9bXzUu
         dFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCyCejByHuHVKQ9xdPLrHrDk1fLOuOzLNk52DGNqOZuN2ch22VyaT2iRAQOhEozE0+Q19K26L19wg5whzo@vger.kernel.org
X-Gm-Message-State: AOJu0YyBArM1oAouvfoF6uC86QOUr8HnEYxV3NwI7KXGayfk1BfY0Pbo
	5yGJpombq2Tdm3lmJyk5yLJG08/efZ2QrRvHOZMRTRYyY21c4Z1f/zbvQvw/MZMJOiLjSmkUACi
	IUwf3RDc6FoXgWz4t3XqKNnvTl7RfscHEQqYXPEopxppwEwgqh0ydkgfMUiYsQ/2fBki8
X-Gm-Gg: ATEYQzweInl8IMVF9EFcZYmQNe8x/ND9tmiBzbjX00+Gtf6iZkp/g2LEjCv31uiygZG
	MPqPlUyLPqRhC+W4GlQasKVe8XbR4+HmxrD8/a51Oda/ukVSGxo5bPBmh6q5eqVxoVyPl4nJM0Y
	yHk13MXCsD2owlxVAmgAyNq6zIWfSZ6+j7Lt//mokARwMOzUUToLZ9hGtchqLPD4YSalOsNO9Qk
	w1sDpWfIHuvi1KjNXHS3AhvafIKbJKyUs9PDBHroVyJyjArjyY3U4iwkhvHuq7oyhc9DtSzuzJX
	COD2AqTZ/k7eXZPOkzQkjBtON0zuxVvhtElGHfL8YWA99lsGS7+iP67zDHwUf0BGt1F2ojqpPYY
	HqmeZqCOHbroG6aaLsw1QKKDqAtmJongDWH0czotb0x2flIfFY63Th6QwSSkcJDXcJ2N6+6ZJs6
	oSawtsmjyQH+LH3BAw/X7MWXv6jivl4hvovlo=
X-Received: by 2002:a05:620a:450f:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cd5af95983mr540353585a.38.1772681599597;
        Wed, 04 Mar 2026 19:33:19 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cd5af95983mr540351285a.38.1772681599071;
        Wed, 04 Mar 2026 19:33:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123583e48sm1664755e87.18.2026.03.04.19.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:33:17 -0800 (PST)
Date: Thu, 5 Mar 2026 05:33:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <vwvuwzmwqvskibwdobuapsr6rpsqmpknirco4y4jjcav27fiji@g2nwxdj5dodc>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
 <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
 <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
 <fjvug6snigssgheuduzjomzjq6apte2ggixqzjzziwcycee4l2@irh2mkholacy>
 <b0d04ced-8f3c-4bd5-a5b5-0b2f12aae25a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0d04ced-8f3c-4bd5-a5b5-0b2f12aae25a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TtgNq6DkbcmptMEfi0oocjX_hMJP6Uif
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a8f980 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=n19I01RymS3B12SaILkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TtgNq6DkbcmptMEfi0oocjX_hMJP6Uif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyNSBTYWx0ZWRfX2S3rSrgzBC1p
 1WsqwYPzyEa1lCNFJcQLmblRPzRZWGv2GvSHZ/XtmGI8IymEQjoBJzpZHY+/hRhwDs+4vqCLoyE
 QSy0zG5bDt2yK7RTu9iHeuWDOfN4Qz62ZY8U+lH2s+oFc2JmRmg1MumRdgtIq/IPE2ohyUyasRG
 06RrDI+LdpkFz5EEx/LhJANkTZHj1Q2eyWy6LE/KYL99GKCx2CZHpc4yRwSHcSNdHqKHzGrFe2H
 KKTlg9HcNKV+A5bMIY4nwd5hx/n44akn8z6RAme1NA+GFx+d+eFHHf7WJdPHuWBU1WmdMQBu6C0
 s7aT9DAMr/v8RW05Nx0VH51fplhVkqX2NRGIujPwg6uw7pV7/qteZxmGj2YY7Q4HMOWzB0huogA
 bX3re1eZ7ElqAQhPWSN0X1e49naeKDAy0j9BbLhj2NgTHQGPX61Gcd2hRrkfiOStaB5YcpxtoBN
 ZJUpuOKYK/hec/35y2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050025
X-Rspamd-Queue-Id: B03C020A8ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95489-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:32:53PM +0530, Vikash Garodia wrote:
> 
> 
> On 3/4/2026 5:23 AM, Dmitry Baryshkov wrote:
> > On Tue, Mar 03, 2026 at 11:43:40PM +0530, Vikash Garodia wrote:
> > > 
> > > 
> > > On 2/28/2026 1:22 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
> > > > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > > > compared to previous generation, iris3x, it has,
> > > > > - separate power domains for stream and pixel processing hardware blocks
> > > > >     (bse and vpp).
> > > > > - additional power domain for apv codec.
> > > > > - power domains for individual pipes (VPPx).
> > > > > - different clocks and reset lines.
> > > > > 
> > > > > iommu-map include all the different stream-ids which can be possibly
> > > > > generated by vpu4 hardware as below,
> > > > > bitstream stream from vcodec
> > > > > non-pixel stream from vcodec
> > > > > non-pixel stream from tensilica
> > > > > pixel stream from vcodec
> > > > > secure bitstream stream from vcodec
> > > > > secure non-pixel stream from vcodec
> > > > > secure non-pixel stream from tensilica
> > > > > secure pixel stream from vcodec
> > > > > firmware stream from tensilica (might be handled by the TZ / hyp)
> > > > > 
> > > > > This patch is depend on the below dt-schema patch.
> > > > > Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > ---
> > > > >    .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
> > > > >    include/dt-bindings/media/qcom,iris.h              |  18 ++
> > > > >    2 files changed, 279 insertions(+)
> > > > > 
> > > > > +
> > > > > +  iommu-map:
> > > > > +    description: |
> > > > > +        - bitstream stream from vcodec
> > > > > +        - non-pixel stream from vcodec
> > > > > +        - non-pixel stream from tensilica
> > > > > +        - pixel stream from vcodec
> > > > > +        - secure bitstream stream from vcodec
> > > > > +        - secure non-pixel stream from vcodec
> > > > > +        - secure non-pixel stream from tensilica
> > > > > +        - secure pixel stream from vcodec
> > > > > +        # firmware might be handled by the TZ / hyp
> > > > > +        - firmware stream from tensilica
> > > > 
> > > > Why are you providing description as a list rather than describing each
> > > > item separately? Then you wouldn't need maxItems.
> > > > 
> > > 
> > > rewrote them as below and dropped maxItems. Please review.
> > > 
> > > iommu-map:
> > >      $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > >      items:
> > >        - description: bitstream stream from vcodec
> > >          items:
> > >            - description: Function ID
> > >            - description: Phandle to IOMMU
> > >            - description: IOMMU stream ID base
> > >            - description: IOMMU stream ID mask
> > >            - description: Number of stream IDs
> > 
> > I'm not a pro in the DT. Is the itemization of the first item reused for
> > the rest of the items?
> 
> yes. As a trial, if i remove one of the itemization from above schema, then
> checker throws error saying 5x9 arguments in the example is *too long* as it
> tries to fit it as per schema i.e 4x9.

Ack, thanks for the test!

> 
> > 
> > >        - description: non-pixel stream from vcodec
> > >        - description: non-pixel stream from tensilica
> > >        - description: pixel stream from vcodec
> > >        - description: secure bitstream stream from vcodec
> > >        - description: secure non-pixel stream from vcodec
> > >        - description: secure non-pixel stream from tensilica
> > >        - description: secure pixel stream from vcodec
> > >        # firmware might be handled by the TZ / hyp
> > >        - description: firmware stream from tensilica
> > >      minItems: 8
> > > 
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > > +    items:
> > > > > +      $ref: '#/definitions/iommu-types'
> > > > > +      minItems: 5
> > > > > +    minItems: 8
> > > > > +    maxItems: 9
> > > > > +
> > > > 
> > > 
> > > Regards,
> > > Vikash
> > 
> 

-- 
With best wishes
Dmitry

