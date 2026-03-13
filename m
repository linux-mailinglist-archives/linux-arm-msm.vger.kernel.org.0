Return-Path: <linux-arm-msm+bounces-97559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKzqIvcytGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:53:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF772286631
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D16A32AD763
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B979C35DD1C;
	Fri, 13 Mar 2026 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfQivWv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+mefRnG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3D635E920
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416962; cv=none; b=p78KKDiPi1IUNemYWclCwcNY3tnEh3ByqC6yE21kG8qTVrd6Lu3c/RItSU6/vhURhFrX8T7uTycjSdgeJo6qUiH4ljMLb2uPtao6FwOAmY4b9c0OonVbz2CMEg7sg6R0cEHGcGtrQU+oI9B4mmGLL/DcO3qRx7CV4+d7dYWCa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416962; c=relaxed/simple;
	bh=WYsK0XfUSbf9X4rYQOwsUWh43j0wPs6NcQoqe4/qIU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHGimSC6w046Xga0DlIsPU6Km6l+84StLYyN+BEqyea6Ba6e69sF2GkwpsJdusDwdvco5ftCNqUo51IAtseT6yrtmFXPtYTsQVGRPD2qUpI0dwdz0GEvSCBvTOwX0s6Ui6UzKOMf6uJo8kCobTBZQNGHSXMYLuo/uxEaTidJoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfQivWv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+mefRnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDeZ9Q240513
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eavIjI1H7Ko1yWv1fuDSHAZF
	EzadTk271QFz6euBTIM=; b=jfQivWv2vBik1XbYMo0AlyM/iDCJf/P2bN3JkfK4
	PWrGrcPVvnTrvdOgfbULpBDRkzHK4SlY4FqqUmF4vN1InfxCgoX8YiptTWdmj4lH
	KJf5Y8eNq9ErM8FmklnmK43GFCmtgKldzys1hYME9uZ5jo0EKUs9zswD97txoRHT
	AYy86SWJJ/8FHvNOcvaqYeQ9EXnFN5+E+NPB9UL3KeSBfVaBF8Y8G3/WAOux23k5
	RNm1Z98DnFowrX1zyVeMpKHXb+BlLrEZq23qOw/i/WJ5Rd23jbqEuN7ztyZdRACs
	phdQy5ml8WnP3vuRTuHDOZYtkpFEn2b3s+5MeCpBubRCJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d9s77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso2313269185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416958; x=1774021758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eavIjI1H7Ko1yWv1fuDSHAZFEzadTk271QFz6euBTIM=;
        b=Z+mefRnGBWd/3D/+5pggCtEBMQ0tKf/1IW/dYULggp85lgWWmGfw52VB1nWbMCmBXB
         g1v7apwRjuvMW5FjC00HAlW42KZ3pC2TtbSHrLIHYQvxsGjynE9nDhisa6pfXV4EEt0c
         k+tpLvkW1fW+p7UY5bmqOuJJEqMOBxLAozELwJKaKxJkgMasZXA1MhDoHgHLxhp3GWPu
         xZj/Qo39vVRtAPAGGnBi3QE08jXMijVfrVoNkqFzgRq/0m9ZzGBJQwISioIKZNTA0QQc
         Lg65pbVI+IgpK2tYSTiVi6wYQUzCSMhf4WraUG3f7R9qyQSc1JMjDArbIr/pTSzcB1k6
         Ss8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416958; x=1774021758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eavIjI1H7Ko1yWv1fuDSHAZFEzadTk271QFz6euBTIM=;
        b=kPcP5TW2LWv4S+VQF7Ujz7d5oovYcZoSGi+WKbTZrLM8oEeFxHWBwqS1OIeG3M3Cqf
         eE9qQDpMohMeEINY+iS6rPWI1mmucRNEAOansZKrm2ISrQ3TXXaqH/VGWklbusnIQX2r
         nfHKufa6XC9oIcxobuxpdMwmcHH8ZskEWmcfDQcFQ8KlSWsCXEb9+0w5GuZSSzyT+FCs
         zbisdEk8ajgZ04qI/o54OAt6Fu6KFgHYioNAc29x3WbmHQuTQmEaOJG+ezX5KvUEdnMT
         sK83NEBw9o0ZLdK67H/oYCTMw3DEt8hGBq/7FkRZ43jWSTsseCCw+gxxfmRm0qe5fRbs
         /5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVtWCgXyx+QT1mnB47it2/GZUvqmX9YpLwFVwSj974T34b7WtJHoWY6+Dpj0BYVtdW+UW19tpL2ifDqcaSh@vger.kernel.org
X-Gm-Message-State: AOJu0YzgmmY2tOS2d/9fT+vwcDJ4GJr7bpARExo4APQdYzbq43qFNgTJ
	pcZOnnF8au/5eIeRaE3hMMNh1O7iTKpB8mPwNMXH3ZLvI0qgAT2EA4ESDR3cg48+uiitCkRLTJj
	xKs8vWisCerTLTBJWfFOX9xi/hPv86KGvYLlILmAWZzwXvggCPzrI+G1jZh7IbHAKk8ri
X-Gm-Gg: ATEYQzxmz7BOFzxj3zTuK/LTcR1ws27s26xpxfyuzs3MDVAAYnNtNqVgnzkEGKWSXGx
	5PDFu2BHCQ2NII+dLNWhfFQsncYmuOlCwlWdcMil5hA8qUXwvWG6Lt46XDd3xMfhFYUku7jpL2F
	iWX2jTjLAoBgHAaIxQIFB4XlbCqONLI1ug7J4XxtYzO1Ei8NfP9Y1iQeiFY3S8cp0jsZuyJl6YZ
	xQFQPImv5FLJkSl7npVqOEsg1zSjOD+vVtehmGOwWD6MN4H/fxYPT0hOPYTWKoX2tPV0kqwBYpx
	tAIJIaAlEePPoTud4CpvprZnShgJnUqJHL3SjBg3CIdzP4O1hybto3iVXGrHFux2h9W1DrD97Tz
	XDJ3hPcDgAqXY/tZXBXYZjhB0INqpqHcL0lLwN8CfQrAAUw3U6egPIHzasIvO3ln0H4sjwoh/OY
	++UlXeW7BLd+YSnRvuxH/+6Rl+A/rh0fTb4jY=
X-Received: by 2002:a05:620a:6919:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cdb5bafcb9mr556982885a.67.1773416958609;
        Fri, 13 Mar 2026 08:49:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6919:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cdb5bafcb9mr556978785a.67.1773416958141;
        Fri, 13 Mar 2026 08:49:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b08sm1565469e87.53.2026.03.13.08.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:49:16 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:49:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Message-ID: <4o62p4iyhb6g6aa35kbs7ylet5aeeojkbqg2qboue3wbxjdzb4@k6gmkhfzukeb>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U2fTaQWaoyoXr65HJdoWRcHEItv5xrxL
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b431ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7wtgjnKuI7ixzQLi8VAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNiBTYWx0ZWRfXzWwYXyjvZNIN
 osxj9M1CcSLPewkyFfVd0Emwey0n2vTxzGcDOBCY5oBjmjw6JM8ZkHdFSRQ79O11KSRf6g2dTIM
 vpeEQN4jILVx9XCvjQSP9ep6B8+Ur/PkRE7FbqIg01A1mFxCilSyUfoEeCCIDEoLssv0Qc3Y9pM
 QcQVsA0iKDeJYIOxpWd8d1R9eqFcpVPzDCRyhphG7YLu5FebAJYtrvHhZDo3AarGdzL307WlsbW
 TcYjaM2AQLoGExeJNb1VsvVt204pif/vXIWQTZW96zQbH3FBuAF1no5o9myhul9iHyXDNpXKjed
 mkySmyeWJ/aYmV3j3f/8Kzg7vPNtxWWS5NQuqwt3dxuy1n6Z5XPl1R1Kmw/ghoRZcsB6l7htR3o
 rM6AYxYf3g2CQxjd3+gzZ16Z990VrcPO1+JtDweMXL6/q893z/IWEeSC7ifP7SHs6cJzX+DRSDC
 oMdvQAUo54FSGdsCnvw==
X-Proofpoint-GUID: U2fTaQWaoyoXr65HJdoWRcHEItv5xrxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130126
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
	TAGGED_FROM(0.00)[bounces-97559-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF772286631
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:59:55PM +0530, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

