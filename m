Return-Path: <linux-arm-msm+bounces-91897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM1SMA1xhGnI2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:29:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C12F14C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 699FE301C151
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA233A6407;
	Thu,  5 Feb 2026 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKBlJcYx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8q3cCOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68243A6418
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287350; cv=none; b=gdw75CzvrUiG9qTQecyVFov7bNqa1Gk8ai/tTe6twGhNV2pGLZKBQSW+oHPZWH1a9Q+pp0ymIlcGJEeW9OfvTIizFw2O8ET19BKTa0VJbAOfbOIG6t2zNfAb9MerVXFqehXj9t3gypT0eE40rkelLVodYvfS/pqHOUzu9zENsC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287350; c=relaxed/simple;
	bh=lOSPphxdLpnW/GUkP9R0RFv6lrmvP7J90BHbPaGrAHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxNDAXF2mEpD64S1OsaNWbXiPboRutIlRPV2f8AYTar1pRlugxkyoD53lyieYkRB5KB2xtYr11uDKp7IDpiQJOsjD26shkPnt+dglG82RXDheAH1ShWfkJjqyn3xcKSbu9/lkbJfobIdQQTKeLaeHQdCT+nHs43Iaew7zPQ2e00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKBlJcYx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8q3cCOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153eJl52104445
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 10:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qw/aPbS3Kdfg4t9YPsugXtBRDxY6QVXkmtu5tBg1hKE=; b=JKBlJcYx/IXFxPOH
	PPBv8/Dw+tBIWksOljoOAes8GETV/+gmBQPpEw/jqNg0n8gmZ/0NIIweEZ+eOzYl
	R+4BmqWobg1jjQSYKGngeFX23QLFn9dOWhULJxGZdhpoVyL73eR++R8h+QZ9/D9S
	1d7zHZ32/yUOCH8sIM21+HTdveyz4HwtA8GHoJAjQgolGtHqtZaFuqq5Tl40Oql/
	x22YH+xxRdqcDo+8o2OrcCqox66kkpX7Ggner8/jISo542mtA86VSQqVxVcihS7n
	/vEt1lxKc63awa//f6ohQt+zGFyZvntvI3RT681RQ1tTaUCwz0g8SUpTBkBp+5AS
	KTqPnA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjkxr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 10:29:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89470bda22aso27644466d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770287348; x=1770892148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qw/aPbS3Kdfg4t9YPsugXtBRDxY6QVXkmtu5tBg1hKE=;
        b=j8q3cCOgDgw9aipKwxP8UfgJcu/9aCxLSiVHhQtSIlaVNvCnUApanmtO6WZ+2sh69D
         DX1FPj330RPz3QSg7p1r7XIvzn4O5awiyzhyZQlxtWgwGoN9m/XRahrvDnXMK+nx3Rca
         uNvhqMwwoKxFmfIvJwYk5D6mdLVijft4x6X4/9M2n9nhLYZYO+cal3PJtMe+Kj7DwPR/
         pWlSglU/AnjhjAUGzlotIs0tP+0MZ8fgO7qfn+dgwkou7lWG+1jpBHrvwTXcEpdFdpsn
         +VbaUexD/jW2xQUIPLBCbVpmggLNgeGUTa2EJ8j2xXjnG6qufBTtp+igymKcZBfZModK
         yf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287348; x=1770892148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qw/aPbS3Kdfg4t9YPsugXtBRDxY6QVXkmtu5tBg1hKE=;
        b=F/1iEbogDzWo6wPj3V9jusrkPfvdHuLP9ceRNgqy9oeZuvFZ6Vmuxx7k9kHU9agaIa
         YwXhJkEQR7jgGxh/K4Avvbp/Mqd7141hv5ZdLRZAe131u3CxvvaKhyi17fMXpL+742GO
         fwmY8ZV1HlF4QiF0GiR1wqy0osXHSmDVxcr2A6z45Pw4OcFTv9LmxGrw3Fd2zskYvOHB
         YG5YVTALVikXPXG/CpYJewzCnssaVt8m2CTrzMh5MVTYSLFh5n7by7SX+z4QQxns5hoF
         AZjzciQ0jFkUJbcVG7JcM/1DI506glIkhTDZfzYf/3I2OPUauzYMteEA7Ae2xwMb+eJF
         Juiw==
X-Forwarded-Encrypted: i=1; AJvYcCXFMsUicKhzwIGKczRrLNNoPs/liYCY0FicysJZeMzQPve7SnvPXrmzWkrdkPJwX1q7/+hB0vf67oTDIH8t@vger.kernel.org
X-Gm-Message-State: AOJu0Yybwn73220pmOi4kZf0EefY0pFqDkeAFbf1JFP//paJ5VHnrHcs
	DittrPCfCYE/e7QE0VtA16Svyx6pZFFb8zUksJ5qgNidrjNLMnh8Dpmw9J6MyH9vYvGP9PR2WZc
	QDX2Sz/kQA3VJ8bTi7rAH16jpCTq65ENYkMC4WefeitRcVUhI7aRIcVkZFRC9KJ49BBf5
X-Gm-Gg: AZuq6aLulwkEiiBwHYFhEE9Uhhhwcp4AN1Pl2q8hZYMKeG5kR+K3WkdqQqjLLFwldqj
	e2XEL/TY7Ws4mMF9A6S7EemYZLt1U31lZohZsdNqvO9sEW28kk83vvqVw1XuTCd/k+VzIkS3Syj
	IB7ndeQ+lST/Uf1qZWebzvSUo3ooGO2EJJhKxW141R4kB4y0naanqBa65tuU6xbDD5B5AOhFsGE
	qoKTk+UMAJHGnC++/1csCXf8jvfG9FgjajB4Jdq8VRwM7FdaepbvG/iQQDfIKi9srig3PswERUp
	YSvFodQUGPdAaAZxrM0XesLJsN3F2oQRVNHmOcm6W8zjj1eqb7Eefowt/qvkM8QRczDFZcoYboL
	fMOW//P6wQ/yJ9aSiP1qSRZu3OKcX+upTss1fwOxrVuhFc3L2zBiMOJnkpXmb+0ydmOa2+OWblv
	1JW94NqA5UNsybLoWcbXsc5mM=
X-Received: by 2002:ac8:720e:0:b0:502:a3b:f367 with SMTP id d75a77b69052e-5061c1a14c7mr55819001cf.51.1770287348095;
        Thu, 05 Feb 2026 02:29:08 -0800 (PST)
X-Received: by 2002:ac8:720e:0:b0:502:a3b:f367 with SMTP id d75a77b69052e-5061c1a14c7mr55818781cf.51.1770287347611;
        Thu, 05 Feb 2026 02:29:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e388327b5sm1300282e87.102.2026.02.05.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:29:06 -0800 (PST)
Date: Thu, 5 Feb 2026 12:29:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,qcs615-rpmh: add
 clocks property to enable QoS
Message-ID: <luahjv66e2h6gvxygmy2syzvt4rmdzqlfig6um74ysfhidyztc@eu4whsehmm5q>
References: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
 <20260202070534.1281652-2-odelu.kukatla@oss.qualcomm.com>
 <b37e6569-61e9-4998-8fc0-603b83edfa2a@oss.qualcomm.com>
 <95d42fb7-2365-46a0-a995-c9cc51b17424@oss.qualcomm.com>
 <ac26d960-5c05-4681-aefe-4827b74ef29e@oss.qualcomm.com>
 <a9c2f6e2-0185-4a1e-bed6-fd1f542b2367@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9c2f6e2-0185-4a1e-bed6-fd1f542b2367@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=698470f4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9aaagK8SP8gl9O57y1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 4kskdTqQRleb7LiH-Y2YOEvSCf7I3__R
X-Proofpoint-ORIG-GUID: 4kskdTqQRleb7LiH-Y2YOEvSCf7I3__R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3NiBTYWx0ZWRfXwjcmPCbkl7P0
 EBLauRh9tEAvtJD6KBlF8BAiKJ0DiZirXczkZ2OdMuy+O6CW9qEz9u5hhElqknGhhj895PhVK6n
 hTHFLSmRzMotWVgW58U6gVcNs3PsZrngLzDoGtI+9AOgGnjCL90a+4fQrVKHRvubW+yZlInDOUR
 sSbCmnQuTEfRBwJfer/9JWFGmhCPlZAq6lV6xeOnDZmMwcuXSXwFx+h3prZXWFEuFw8IujsfvLG
 IQtOVPrsXhl2LhNFFAut7gkzq68eG2GhLYhRvLs3rguNaCFGr3uFhepR14X+SSZFUQW7LumjYnD
 k3ZIaSQEnAbasHkYXDTnlNwZ4spWgZWifNzSljiHL1rHZFaR43vb8v8K/xIDgFVkxNCdRFX10bL
 6kC4+nHTrEpd9LsaTM9RJDCmQV1KWPS0N0oEezXiamPBggflmonwN9YnocIfGuoFl75rmVDqmX5
 ZX57g1LwBJCexrS6FQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91897-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00C12F14C9
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 03:10:31PM +0530, Odelu Kukatla wrote:
> 
> 
> On 2/5/2026 2:31 PM, Konrad Dybcio wrote:
> > On 2/5/26 7:06 AM, Odelu Kukatla wrote:
> >>
> >>
> >> On 2/2/2026 4:33 PM, Konrad Dybcio wrote:
> >>> On 2/2/26 8:05 AM, Odelu Kukatla wrote:
> >>>> Aggre1-noc interconnect node on QCS615 has QoS registers located
> >>>> inside a block whose interface is clock-gated. For that node,
> >>>> driver must enable the corresponding clock(s) before accessing
> >>>> the registers. Add the 'clocks' property so the driver can obtain
> >>>> and enable the required clock(s).
> >>>>
> >>>> Only interconnects that have clock‑gated QoS register interface
> >>>> use this property; it is not applicable to all interconnect nodes.
> >>>>
> >>>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> >>>> ---
> > 
> > [...]
> > 
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            enum:
> >>>> +              - qcom,qcs615-aggre1-noc
> >>>> +    then:
> >>>> +      properties:
> >>>> +        clocks:
> >>>> +          items:
> >>>> +            - description: aggre UFS PHY AXI clock
> >>>> +            - description: aggre USB2 SEC AXI clock
> >>>> +            - description: aggre USB3 PRIM AXI clock
> >>>
> >>> Should we also include the IPA clock here?
> >>>
> >>
> >> Thanks for the review!
> >>
> >> For QCS615, the IPA clock is already enabled by the bootloader (xBL) and
> >> kept on during the boot‑up stage. Because of this, we do not need to
> >> explicitly enable the IPA clock in the interconnect driver when
> >> accessing the QoS registers.
> > 
> > Would we need to re-enable it to re-program the hardware if say the
> > icc module is loaded after unused clk cleanup or after a cx collapse?
> > 
> 
> IPA clock is not managed by GCC clock controller driver, so
> clk_disable_unused does not disable it.

The clk_disable_unused is not limited to the GCC. The clock is managed
by the clk-rpmh, so clk_disable_unused applies to it too. 

> As a result, the icc provider
> does not need to re enable an IPA clock for QoS access after unused clk
> cleanup. And QCS615 does *not* support Cx collapse.

Does lack of CX collapse apply to SM6150?

-- 
With best wishes
Dmitry

