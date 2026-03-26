Return-Path: <linux-arm-msm+bounces-99992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNN7LvucxGki1gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:42:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC732E70A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B81D8305FFED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AE239150B;
	Thu, 26 Mar 2026 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+LOh+dF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1d2s6gN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28961355F49
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492657; cv=none; b=mxuORN43j/5a2HdPKcm2zGVuiHgfTqb6hTSq2SgjmV5dkbUy8hefIiOFTo1GgWytkQ+LEDi1k8uDT2jp81MBUKFHfA5TjPXDXtRNelnNJWTHLUmhxn1L+neGfwW0bdOFkeuovRG9LvTMHKdT6BKzhfe/XxrhbXfT/BFH+wEu798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492657; c=relaxed/simple;
	bh=CO1Xl56yA5yxPK2Rf16ztEEe9RkQZ6sk559VWf3vJs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzBBRK5I9zf0hGDTPpgjNiQgTTqvQK+AJJNSegajjVWEhuJ0Gl/8Te8PoYl0wJzZifw5HgLbR2cnw4oimup4rLpD4cGmksCamHBPc4vM6UHrF3kmLu8CvIpCP1hfCRMlR37421JcvpHBfgWMSWgp3LmhXzcPy2nC2vIArdB2OJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+LOh+dF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1d2s6gN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PNiXDx1554621
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CwMbSu6i+zGZS+U5lR/PyrPE
	FdnGy+7Mp+i4QCz/JXc=; b=X+LOh+dFyy8by8iTQRT9qBXkrBh0RMeqsY4GDZ36
	WO6LjrIU2iOfA2gVZPigWH9uX6kNOU2q5zD2QN2LRnKKeQsv6kkSVMENRXxhuqBF
	/mDjdWsROti5ukqIiqWneDCUVYbjuxuLwx79oJL+MT6o3wR9iVTZ50iil5ADvxYD
	4ZwLjKEo2bij/tDRpw5hmEWtI0xYUgOkpsCaZmx+eKM9uvtO2i3fKKRpGMiX2V8f
	RodI2vy7T3l1SZJtTAwXsoCqKkdmIEWwBXYISsPaewaIB+Y9NWSy/f67DG//gDUd
	B41xxYa3lCPTZoSu9sbB64M3dFW2j5pqJCmuVaRKujsN3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7ahtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:37:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c4a339b6bso16622746d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774492653; x=1775097453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwMbSu6i+zGZS+U5lR/PyrPEFdnGy+7Mp+i4QCz/JXc=;
        b=a1d2s6gNg3jk62GwrH4IRZ3UsApVZq0vTU7LUuRXsDPld8aYvTw0g4mJ7/I1evDcFL
         jfBesTzXLTNzRqr8h6Opo0wqOjmDYlt25+Tt/TEIRJKbF6qg0dcg9gP3Eu3PfIXcAGlp
         ji8JC/e9pRu+vHOhrMFFJ5k6GFZxG3VRxF8k6YKIT3MCfe+71hIeu33sAX6ZZAk0mtyA
         slkSF5UuxpYxeRhu/FEeT1ZTQqF0MujuKhbrLI89BdHTLMl4mAlXpegS2NAGNOZcYBlW
         hf3Q2tYQ1yeJBHYbrn6JkohedLu8mvYgfs6k+Z0L+g5f/Vta3UmGv2/S2Q/8on57x2sI
         i87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774492653; x=1775097453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwMbSu6i+zGZS+U5lR/PyrPEFdnGy+7Mp+i4QCz/JXc=;
        b=a0cz1YrlUkaqauICREfz39nLCHkWkKxh+ui2Bq8xp/JFMP1rolUgZEn+Cm+JXMSDPh
         TZ7+cdbCB49pCuFoQnSCs/Z+moZhazYwlu9G5AczUDK9XzKR3p2t5L2ScApXCSVUI8//
         WEgol/mLvii0U9q3t0Ursc/BqRF8uKr4ksdLh0tte8cgrNUzKI/WkUiL4FJepF1uOZit
         WAn7zpbSlJ1LZifxpeFpuqTf1TuCvXSifK9mFqcl55fb1ECgAYogbGo+yP/D36RC7mKk
         eVCW0mK3sBLXuuR2pBLmMzk9slJ1V7JdkzMBC/O3qFOOLTzdHilJxCK5/DI6N6HHgqhk
         5TXg==
X-Forwarded-Encrypted: i=1; AJvYcCXPLrzglBMBNrQlRi7JPLMEWGHzhR9HWXgUe7QYC39Li9/pBEuyq2EEQZlEVzsUdmJIVcLvQmvCo7BrKNrk@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJAsggBRkyltFgkbADYJalaivrIRKu1F7/vFko/oaetlvMoy7
	mfM8T95Rbd4psm2rFz4si9IU9yPbsdCj9r9ESye8h55Y/HC3oFkYpGURAJ076cU0/ie93Q1RzXK
	e7C7l+ECDdFESkBiIpJlQrEHTjyWEPLpQxGcdTtILKK7derfkvAK/VSzhQU0RUx7WzcEk
X-Gm-Gg: ATEYQzzFRWB5zJi+ArUKq5n1NcD4ZrL6FeSlEtChTs5rxDnL1doppq2482eo0xQguS6
	Fu0jv/TGjou+VcMTWEZuBTXVS9KxMFQ20RI4rT+QuafNx4OrKN9YcG3BVBlPZS7ZjN8/lsH43Cg
	BbX2jWIc46u9HcAhc7zY7c7VdA7uZZDQaUIo3r31nLJh2bogzflOMgYeKFNgKk/Vy8ePSNOIwao
	8PtH29eVU4A+UTWauROIxVrsw9tR8mDXdMp393Ym+bnGRuLRF2neGoz36DSSwxsYJQSA+p4wfTp
	6ltEuwc1izFn7yCRrhK4TLFJ7mM7fpKJ292FM2QLiCJJVXvJZk9KGN4IWhJOrEQqiEtfPaACHf3
	2ufyge6CIKcdt4RAbDuL0GhtKeFyH50ljAnodKPBoG7aRV8cGDLJnuxBXqt/VJFpQeX/cmeQ/ky
	wIzIswWTg=
X-Received: by 2002:a05:6214:1d03:b0:89a:593:fb30 with SMTP id 6a1803df08f44-89cc42b20e5mr92905626d6.20.1774492653529;
        Wed, 25 Mar 2026 19:37:33 -0700 (PDT)
X-Received: by 2002:a05:6214:1d03:b0:89a:593:fb30 with SMTP id 6a1803df08f44-89cc42b20e5mr92905176d6.20.1774492653023;
        Wed, 25 Mar 2026 19:37:33 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5a6a840sm12899956d6.36.2026.03.25.19.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:37:32 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:37:24 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kaanapali: add display hardware
 devices
Message-ID: <acSb5F9gZAVg76V9@yuanjiey.ap.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
 <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c49bee cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VCkt8IDonr1v1M0M5vYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxNyBTYWx0ZWRfX9RcA9k7MftG9
 NPCSFy00bCLk18T3XYj8eQYXdvPxpMzb+DD31d/t3JqSuU1Le6ppEpkGfnmSRcpEwmm+C5BKh0q
 TK09GjOKfIbDanHY67I7M+vJRXBEK6cQBWxby3cyMfYsNOuUImqJf23KOw7CTkv9jl1BMW06jRz
 ynMYiJNSFVnh23S0RXh8ArRkE3aXPkFEZT8I3rMqyGUHBEUOjtTMJvtjwBlDipNdJWRzl4GmIwV
 p7UjII0dVeT3yMgI+U/dngqkBLPGImQe4+b5+9vPtL/DOt9EnL0c8sfZ1hOND+BCFfdFGuBlUPN
 NqZSyxYEI80+SR70DtPADUfbAEYVBk3rVE5wvSylPMDE2JvbdNVi70t+WDti/gxPHhmiVdiyn1O
 P/QBxDC/v2upEuIU0g+AsX7UzFTfoCToKIYAC62gqq6asu8RN+phyUvmNSE+W0L+5WozbFfbG9r
 NotCazHnQhIln+HuTHQ==
X-Proofpoint-GUID: zg8S833uPo0fj-4ipMUPQOWOhqEKKq4X
X-Proofpoint-ORIG-GUID: zg8S833uPo0fj-4ipMUPQOWOhqEKKq4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260017
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99992-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56CC732E70A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 03:20:15AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:45PM -0700, Jingyi Wang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add MDSS/MDP/DSI controllers and DSI PHYs for Kaanapali. DP controllers
> > are not included.
> 
> Why?

DP driver is not ready.

 
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 242 +++++++++++++++++++++++++++++++-
> >  1 file changed, 240 insertions(+), 2 deletions(-)
> > 
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +
> > +						dpu_intf1_out: endpoint {
> > +							remote-endpoint = <&mdss_dsi0_in>;
> > +						};
> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +
> > +						dpu_intf2_out: endpoint {
> 
> Missing DSI1. Please add it back.
OK, will add it.

Thanks,
Yuanjie

> > +						};
> > +					};
> > +
> > +					port@2 {
> > +						reg = <2>;
> > +
> > +						dpu_intf0_out: endpoint {
> > +						};
> > +					};
> > +				};
> > +
> 
> -- 
> With best wishes
> Dmitry

