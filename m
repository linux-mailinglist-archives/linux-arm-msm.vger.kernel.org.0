Return-Path: <linux-arm-msm+bounces-108020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI2VDqdUCWqgVQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 07:39:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4755F507
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 07:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1D5130071EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 05:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6151130CD9E;
	Sun, 17 May 2026 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUcZp13Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4kYQrKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0033D2EDD40
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 05:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778996385; cv=none; b=VEuk9Z4/RzHHPMR6WqJzWvmE90mQPqOKfvi8t4eYgjdivddeTPT+0y548JpIhv7Im11temyFjKUAbt/cVUpDrrY9IoXCl4SMBRQpXA3YsssYslBkkS2A8isHQRcu3VMY9+fuYF1ZV4PBW3ettO5PQy+MZWaCnYpe0lmm/lhlv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778996385; c=relaxed/simple;
	bh=OyrYy3CxVCqxEwCBM/K4PBbKBewf9EfR5aSv4aTPx+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEGsinsT9IZvRkxRCi5ejn2qiFmpXbwgwm7ZQnRleI7iWoxTvI/sg4w4N2m7g8p0U126UY86w4iY7Ivmyz9Gefr3piGDzdDgJsUXLMYJPGzYwJ+1dxPHzCIuO6+tyIkkZ4Yh/hdaH3fpvVSHSG/wiEJ3wmZ0OYmrOGrCCyVbia4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUcZp13Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4kYQrKC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GHUM0N1146717
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 05:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92C73o0HZQMw9i0zPsZfTXUY
	8FwNUtkb+k0e+b9dS80=; b=aUcZp13Y1ffz4lYft8fvI24IcyGsCiQufoVyQxuM
	UZfrNAp49+hAinRO8QaWMKcn06EO3+hhth81njFIBZy+2ECKKOf9PNJIn1dsUz6A
	RWPcztlbI2pRIvWpm5jANVy6PaCscxXnPLKvzGvtsnIVZl1+9ilVGkAOjeem6eFb
	8UTXusIOeKEtxAexh0fgKupVeB9FV/a+ZbuRi6mnkT1Ml8GE1sSOUNgAKFrwL8xU
	94b406Yo9gLERVyCdym7fk8d2bkE9XDC9qw0ZEGB6JomAtrCbE6wbk6XuyK9g5gu
	HLaESroJGR+alhFscRaWJJimpJUQXGR5G74LraEBXMrrtw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqt9mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 05:39:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-303b38ec2f6so1458294eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 22:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778996382; x=1779601182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=92C73o0HZQMw9i0zPsZfTXUY8FwNUtkb+k0e+b9dS80=;
        b=H4kYQrKCblIhRVLitklWjK1tWRvUE6QFgfaTWKG2XOM8ILzuqLc1mvOWC+Qzd3mgBs
         K5Ct6iMNkcYuPHg+BUBC/7W5mogGwk47PvoRxO12KxsbA6k9wkUwwnUlbxomCvM0LKJ5
         gnytucMeRP5/kG3hZPkM1pPlqE5LxgzthF/Y7l7LEF4S1mva+yrprLQlhIME3Kvot2/u
         CXViDHd9j5460SHgKsI3sTxnJ+EdNzYg3DC9H1sQCEndSYGSrLYvNrrVJzKCyQIvyYa2
         Ca0U8Lrk9MxvAkYSPFG74KgVEIVsABeBG7zNQN1NiS4go+jc2NntNoE8fOR5OnwPQXdO
         ogqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778996382; x=1779601182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92C73o0HZQMw9i0zPsZfTXUY8FwNUtkb+k0e+b9dS80=;
        b=Y+bu6ed/IfdYHSpU6hROpgNYMAri8UUwjUehg/3naMGFuhnBdGAl/8jNchTKkDTvbQ
         7x0DxaSz93cc0dHPX2inChQGVueaOFSOct+t0w24wxWx2bHOZh8KzWfgQhLd9j1ue9EL
         dfQo4x2zKPZEGtVuvCjU5jbEdST+HMm017KIv8PtiO3XHK0OR+GFKA0qYHT+tEvRfaWo
         fWO+HQgfr4tE6UDb7jSHDVuqSj28txivSpt9K2AarFx2VnEKcw+WiL1424MitP3W/n3E
         RKPucXcBdqgTqous+5iRFcPPt7IOT9amkd20b/tF5XbS8OkJrVyQeUcknqNiP8KOYISc
         qbpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8khu5asncisE/ZD7/jUwFstdavVSLbiTQvjH/UgPwE3YNph2AmF5sKb6lmFihhe98y4REViKT+C1YDWRjh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0QQFAZwe4+DYP57Drj3kajjiAg4G42lz/wZJ5cpOD9DZldy8j
	ZLCGdCynNvqdCiK515hGdH8lBNXCV5U+cbzI9hG3KQj6RpW+Fr5o/uzYIDJmx1vA1gSn6rtClZv
	TUaddUZK7p22e55ORTGEFt4jK3becQlFU5CfWF2Yu7fqBH+cc4v1YDUAZCN9HqdfVmTdE
X-Gm-Gg: Acq92OFbWdvRuLOcylpdhGdY5I2dOsbniqUaP/m77VUyLp7ElEBIWoRf8JUW2Y/i+PO
	6PhInWvFi5Bnb20sm1pGdWeOz7muaLY0yFByNRhtvmMR/QFG/Fc3fAJd9Qlu9gJj9vdzlCsSWiu
	5U4xPkEhvXr6CdSQNTAAMg1kqY2lYM915rdE2Kkp3yay2AZQpVVt5xz0EXt9iBGKQaacVwACz9s
	EcYEudfXHw25DFkEaQBB6yJRbqHmvC9JZxKO1nxCBiistDNcFwc9DVtmy2RjyZLefaewhxAbrd/
	jZGwVT4NEqxWAJHoA6B4sueNXaf+DaSaVbJ7Q3mANHuOG5LKsAti1C2dottcOZqUGPqZ3lf/psl
	iLLePegYaHwDwqQGwat2sOexq2ShOzY1oPYzO2xQtMHt3o3mhk8kWovRJhaCd4CEdDhcI
X-Received: by 2002:a05:7022:6b9a:b0:134:fea9:f107 with SMTP id a92af1059eb24-1350573a436mr3748704c88.33.1778996381457;
        Sat, 16 May 2026 22:39:41 -0700 (PDT)
X-Received: by 2002:a05:7022:6b9a:b0:134:fea9:f107 with SMTP id a92af1059eb24-1350573a436mr3748697c88.33.1778996380885;
        Sat, 16 May 2026 22:39:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm15485227c88.13.2026.05.16.22.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 22:39:40 -0700 (PDT)
Date: Sat, 16 May 2026 22:39:38 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-outgoing-literate-dove-2e2a73@quoll>
X-Proofpoint-GUID: NzqrFsqCyJ87qRl3m-wDqnI8iGn8DJLY
X-Proofpoint-ORIG-GUID: NzqrFsqCyJ87qRl3m-wDqnI8iGn8DJLY
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a09549e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Uzsr7iAuEFisXTRfTTMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA1NyBTYWx0ZWRfX3D2eBt0ZQziz
 yghyQnKpg8pj9TA1Zyq2luNxsKDLN+8IaCHPWqRlhOB7HthSQqpNUrX/D5vWR4gS0ue7Ffylyht
 O+TPOj+uNuWn0OvGpP0MtxJD/R0xeTebjaJU10jLhZrACY0B+razyowcKTS37rDPVCmms4hj/py
 uZME0ztPwb4NenXgL4STRmjujlMtjLF2EEOIK5/BQLxtGQjtd+drVMMApIS0tlfV7AlN+ET7hpl
 28NzKfykRY/CH8KXAmAZsTbQm09ULFarh3UcJF/UhsL9LAlRkYqpLuAUlQHHtjLjLRxxkL48mBs
 nwF357e7qHFy2rKc+moPAseZE+/QOEpMkhAYg2Q1HaxxKRAFzl2qYVaL0ngh2SIqpdwmF6NGkz4
 3iz+TvLNQU9Sahan+IvlngO3IjN7fMpZQMJ4AyleHt55sF3vStuxEhrzSqyLqnRrsnzOBRwsLr4
 PvYeVlRmFfK8Z+gioTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170057
X-Rspamd-Queue-Id: BBE4755F507
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108020-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> > Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> > required by clkref clocks.
> > 
> > The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> > QREF TX/RPT/RX components, while SoC-specific topology and instance count
> > differ. Document them here for qcom,glymur-tcsr.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > index 1ccdf4b0f5dd..57921cb63230 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > @@ -51,6 +51,63 @@ properties:
> >    '#reset-cells':
> >      const: 1
> >  
> > +  vdda-refgen-0p9-supply: true
> > +  vdda-refgen-1p2-supply: true
> > +  vdda-qrefrx0-0p9-supply: true
> > +  vdda-qrefrx1-0p9-supply: true
> > +  vdda-qrefrx2-0p9-supply: true
> > +  vdda-qrefrx4-0p9-supply: true
> > +  vdda-qrefrx5-0p9-supply: true
> > +  vdda-qreftx0-0p9-supply: true
> > +  vdda-qreftx0-1p2-supply: true
> > +  vdda-qreftx1-0p9-supply: true
> > +  vdda-qrefrpt0-0p9-supply: true
> > +  vdda-qrefrpt1-0p9-supply: true
> > +  vdda-qrefrpt2-0p9-supply: true
> > +  vdda-qrefrpt3-0p9-supply: true
> > +  vdda-qrefrpt4-0p9-supply: true
> 
> Either I do not understand your previous explanation:
> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
>
> or this is still wrong. There is no TCSR here, so this proves nothing.
> If TCSR is TX0, then you do not have five of them...
> 
> My previous comment stay - you are not describing the actual hardware
> here.
> 
The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
as the QREF block, and each component is controlled by the tcsr_clkref_en
registers.

If a PHY receives its reference clock from QREF, it will have a clkref_en
register. However, this register may be located in different regions
depending on the target. On glymur it resides in TCSR, so I added these
LDOs QREF required in tcsr yaml.

- Qiang Yu

> Best regards,
> Krzysztof
> 

