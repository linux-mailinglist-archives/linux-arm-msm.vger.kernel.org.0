Return-Path: <linux-arm-msm+bounces-98225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAMfHlBzuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:29:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B962AD0D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AFA6303FAA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ECB3E3C7C;
	Tue, 17 Mar 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mc/6dmIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rp4qsZA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536F3E8683
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761125; cv=none; b=XYTLvKUq/Es58e/6Zrz8Rym/isccuTUxbxyXRGl18gPHYnehyzT0rB9mj4PpOOC6W84QUAdNCmfEsjsY7lRV6pNpt4jNzUHERI7wWfWghVtbybllm7tGfMYrJjNKz3nMN4jTxARYJifF6Y9EzWYv8rJnZ085cuSNFw8wYhLPMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761125; c=relaxed/simple;
	bh=5zZt273oo9l65sLsgEyn+0QToiLZA55xazJjFHmPD8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvFowqhtFS5WYIP3DoxWObJB753viENfYEqy9RbivGppoLJoRBJJg7bCKz3UDno6qDN81ZdfsXElzzHnppZlLRwoJ3Epnb3tEwR18c6HMHkw0Uhj3vqrNuCTXwDZ4eNhU90jiIxWObX11xyySXOEeg8NT3963i3NLJKVOIz1Cck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mc/6dmIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rp4qsZA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HD50DZ668972
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n3lpfc4ueqzuBt3BqwnPtUpH
	55c6lU1lATwBcd32nv0=; b=Mc/6dmISUtrOSPwPhVr4of/6k4S1ghAAnxJEaVuH
	Rubk1JH3Qp7rf7yFYu3MyIfyjlaO0r+fSAD7Dt3P4pvofwfGT+mPMV2TlcJTISlu
	moweRD7YTE3g8tCoYArijKSOIk79DpPQB9qvJufrNr9bBXkAtHCsB7UO4ulnrta+
	+yNWuNiSvcxgthxQFjIh0OF3V2IJ3KcMxt3ztVoonKjPR7etMThOstkt/u8Lfz7P
	/f0LHPG4LeURWFg6GmrRq80BXJ+aRiusih6BZIXRZ5BRS9SE652fUaphh1xzh0BA
	MYh7d/WI03y5ycPRMdRURei3jTNZISgkUgRAmdQsiHzISA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy7he0hyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:25:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b9e111a75so1297705a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773761121; x=1774365921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3lpfc4ueqzuBt3BqwnPtUpH55c6lU1lATwBcd32nv0=;
        b=Rp4qsZA96MVRfZHgWGe3/5f6NoscXXyKI+O6DSQ3DFygVAfyoPqSkmVxUtbrZj7l8H
         raq1R46mejeSX9kI2caRM1PkNsZyGtAU+SoEoGl9IxNILkeMmvqfOCVYfXCeb/hw7DCl
         zja1d58sO7w638tuBGAg1Twa8g4d2pCTQQuOU3EEi3JVh0MaoncWGjyiPYj5prbfgUbm
         A7LE0TzK/Rx+zszi6PaaFxLlLvpuGCbDuOKFrm88ObmFUldtQbTPVjNT0Ad9d5kQ2XxI
         lDLq/OmU9ebVrfRexDOSqdw7X0keKV4jSTsuwDyTFuktduoqXTTSxUIOBMONBZBZyWJP
         xFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773761121; x=1774365921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3lpfc4ueqzuBt3BqwnPtUpH55c6lU1lATwBcd32nv0=;
        b=enF4cpzF3e9UHK9m/GVhG/g25tF+QhrArPVsRu/6aq+dqDqU9etqXgLyj2tADKdgJ3
         Hkv8/RCzzlxjXFwW/a2wo4zTf09T5m9g1ieWDHwHwY0SSQTkx0Dlhwennmi2xiSfJ+zg
         3Sabrlmr3Y8bOzRLcvfUg05WKtFQwDBpweFlr9DBnE7BTcBfQiM74o6EQj+m5S3gJK00
         iJu4of4KZoGOQlJZJwMU1OPJ7pv/YhKvblSwpYRrgwwZeSIgiDS3ghUndlBsGZyltvn5
         c/GPlAWUc8OojP+i+ToO69MvAFwbCPbe4ArD37s6hxrG5W28+d0Nakh+5RWXw6vHQWE7
         +l7A==
X-Forwarded-Encrypted: i=1; AJvYcCXQvy3YcSQttwMfkxgcQpprAu5YHw6ZqEFSv2lLyzB9A9c/Kfdzhs9DC9GZ1FkbTVfa/2Yh+0L2f23FrTj2@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJYRoMZhsBtqqfWZvoHQ2o+b5NUBKDeq4RrABrSuIA8sC9JA2
	SgqHUBwR3/jp90ZolBZ5MGLyz0RZlDL7/Q7z4jIc2kTb6+BDB0ne5B0ZSs96l58CqlGiC/QwYGY
	prilUE27CBxdsgd76qwK2GWUAtNty99t+3RSRmCWZV43ZC9F2ZhTf8cerXZNVUyuwFcXd
X-Gm-Gg: ATEYQzzzv/QZUUoVXAgNbPThQi0fSA9sb3KGEhiJkdXFkkhFRnAVsc4RzMiDjfPjCoa
	hT9i3WsaLL88hxQ4QdkJwiXGWE3MzAbtmQ9+TTjCx2qZOIuYUnuXGwP/Rn5uQgiHItMdHhRh6OX
	quHmcqT1iIJt+B+9aHMRHLxYpEuJKvXDyM+iXhn22Rg0vnPqNlrkS4dKnjWbJAzN2xyYNrD8S0C
	fY5K4WB8kiFLllOHVSa7C49JXapEQdHMGOd475NdxoZnLc35OE7yZbrup/TyWKBIUIrTY2hBcGD
	vyuWk45f9L8pfSxjcmeeo6agoDhwFg8VQT6HkkmEapKirLDbQ5XGl7ec0WK/jWhL3VsVkAZgbpL
	aNP5rI5SIOLGGsZRbuJh4MHhTE5yy9REUKhb5htEbCjX/tmQ/AOmkYPcVJNsN+KnZG09XvxhCcI
	m09NcojUknBvLrkYOCEK/zFSbRGonUOtpJHTh/V64BAw==
X-Received: by 2002:a17:90b:4cd1:b0:35b:9c28:fc31 with SMTP id 98e67ed59e1d1-35b9c28ff5dmr5852691a91.4.1773761121097;
        Tue, 17 Mar 2026 08:25:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:35b:9c28:fc31 with SMTP id 98e67ed59e1d1-35b9c28ff5dmr5852650a91.4.1773761120441;
        Tue, 17 Mar 2026 08:25:20 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada5d19asm3480211a91.8.2026.03.17.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:25:19 -0700 (PDT)
Date: Tue, 17 Mar 2026 20:55:14 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <ablyWhg578n75gYy@hu-vishsain-blr.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-1-8195fa931ff1@oss.qualcomm.com>
 <617cc5dd-9012-407c-8579-2c08fc629047@kernel.org>
 <ablgwa53EVBD9HIO@hu-vishsain-blr.qualcomm.com>
 <fctd6mwid2r5thbo6nipbpdecdvgvv4kztjlrp2kibs6j5agxj@hn52hjfp33zc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fctd6mwid2r5thbo6nipbpdecdvgvv4kztjlrp2kibs6j5agxj@hn52hjfp33zc>
X-Proofpoint-GUID: rtvClZgh-5l4yasHNDOCJdP2z07w-9hG
X-Proofpoint-ORIG-GUID: rtvClZgh-5l4yasHNDOCJdP2z07w-9hG
X-Authority-Analysis: v=2.4 cv=QsVTHFyd c=1 sm=1 tr=0 ts=69b97262 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7JKd70EdTwDnvNzRtCQA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzNCBTYWx0ZWRfX1jfVJkC6EU9M
 FlYA7lYx2XkTdt5v/uwbRIfSm3XJTvtv7mnxA4HJOTRAnYM0c0eNy+a73DP9o/RxyZTfCwdqA8O
 4B3oxEtVyRTkufyIrOyhlu1Dpxl4oDmhkJJQ5f7G8lmA4MZIyZr6SVOQQTljXOwf3kCiF+CmfoH
 dlpQjvFW/44POyKCgqWEDrt95uO000+PkpFc40aWjNa+ZbqeabJgdqx9Hydg9cUQQQAxkGkBMwM
 CkGebHYK184IuBae5m7Ew7eesfkeqHSl42c7hdhSP3jDR0DUBjOxSYZxaIYFHLDvVTI4h30iLeW
 SvGQNpiBWKjWZifbCKNaZIaMtG2tqrqiI3ONbfgcqRhXbGwuUtqSescDpjF5HBdoj6M7MuKI+kU
 VXsk9LaVQa0yW+IA28xMRvizwmqzjWEkpZrvsqS8MqLXtEZJw0eFcuW6pEvdVt+5wWh6Pec7Kbp
 702JfnX0ulUXpiQfGwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_02,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98225-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-vishsain-blr.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19B962AD0D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 04:40:51PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 07:40:09PM +0530, Vishnu Saini wrote:
> > On Tue, Mar 17, 2026 at 12:42:24PM +0100, Krzysztof Kozlowski wrote:
> > > On 17/03/2026 07:03, Vishnu Saini wrote:
> > > > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > > > converter. Edp PHY from monaco soc is connected to lt8713sx
> > > > as input and output of lt8713sx is connected to 3 mini DP ports.
> > > > 
> > > > Two ports are available in mainboard and one port
> > > > is available on Mezz board.
> > > > 
> > > > lt8713sx is connected to soc over i2c0 and with reset gpio
> > > > connected to pin6 of ioexpander5.
> > > > 
> > > > Enable the edp nodes from monaco and enable lontium lt8713sx
> > > > bridge node.
> > > > 
> > > > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > 
> > > How v1 could be reviewed already? v1 is the first posting.
> > This series was reviewed previously, https://lore.kernel.org/all/20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com/
> > Maintainer asked to submit a new series once dependent patches are merged.
> 
> The patches were already sent, so this should be v4 at least.
Sorry for the misunderstanding, i will rebase and submit v4 to previous series.
I will address review comments from this series in v4. 
> 
> -- 
> With best wishes
> Dmitry

