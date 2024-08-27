Return-Path: <linux-arm-msm+bounces-29565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD32960543
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 11:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50011F227B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 09:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF21199EB4;
	Tue, 27 Aug 2024 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OpIIR956"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9F8199E9A;
	Tue, 27 Aug 2024 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749968; cv=none; b=hb3IEj+4xA2oZV9dJRZ9jIat7hPjdn+k54LX5atXf+n2JC/2uM1RyO0Wf/zC309EWHpT3q/keAkgncuOjV5piuVeDVOWI5B34Q9cbPMLUqh0kCHrL1vD2+pRJg5Hc/BqCmcfcKub8E+9j4qowHFhgHuREoZurmyarJHNx6oNgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749968; c=relaxed/simple;
	bh=FnK8nPtxi3Bq+7qglj1Ib0smYwt/SQArNx5z6qyk0Nk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmuY2Bw1C+pYo71lFCPE2FXl1Y3AG5dNlXMk5YzR0TbzkZcsb05DkMQ/ca9R+qSU2A+SLWq3hhYpn2FX/TXMLMmdBwq2JdTAEhZ7U/0cgFYP02izdHyAyOKYURjToI8O9SSp2Ign+N2WfWPEhD0HZrUXXlm14Xl2wkYVJv4IN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OpIIR956; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7YwE5017528;
	Tue, 27 Aug 2024 09:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QNdN4OF4Dmq4AUHL2J3V6fI/
	+I5hwt1KrF/XKf+afA4=; b=OpIIR9563DVQcrmIe7IV8HgthLmGN8ZBBIK9BLmn
	AeVaSFqHdahdo/FhoRlk49N37GXKUmbS9+0pMD0uYy04V4+NP62PzZtHCko7S6ot
	WHGIeS5pnkMkdDQIbjIj2RW+Bt7c/2q65b0qCJdo23Rc3s7KTnYlHPvphJ7sDxRe
	OISZwrJyJ7rjxqPma4uHG7H3InqaK4IWlXR1hZUcJzMi67L0val/ZHRDFdzWIHF/
	DFoyo/ELAY1Cqm2ubxxSFEWyV61nR7bkH5uUG1Kpr8XL2QdR+gKvbEGz0demuevp
	7o06064kbZ6xYmZobGTarfjXREty0F2vXhtQlKtM8r0G1w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4179dux9jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 09:12:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47R9CgW4022841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 09:12:43 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 02:12:37 -0700
Date: Tue, 27 Aug 2024 17:12:34 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH v1 0/1] arm64: dts: qcom: Add coresight components for
 x1e80100
Message-ID: <Zs2Ygm4rMF4ng0fY@jiegan-gv.ap.qualcomm.com>
References: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
 <833eafc7-46f0-49d1-afe1-ad9d20ca16fd@kernel.org>
 <Zs2I+M4wkjVlKuq9@jiegan-gv.ap.qualcomm.com>
 <af1d8c37-0053-4c8d-94ea-b5639bca4ac8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <af1d8c37-0053-4c8d-94ea-b5639bca4ac8@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ve0JbcSSHJ9GmjJyQ2Y40JHEWCDKRKJv
X-Proofpoint-ORIG-GUID: ve0JbcSSHJ9GmjJyQ2Y40JHEWCDKRKJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=425
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270069

On Tue, Aug 27, 2024 at 11:01:15AM +0200, Krzysztof Kozlowski wrote:
> On 27/08/2024 10:06, JieGan wrote:
> > On Tue, Aug 27, 2024 at 10:02:44AM +0200, Krzysztof Kozlowski wrote:
> >> On 27/08/2024 09:27, Jie Gan wrote:
> >>> Add coresight components for x1e80100. This change includes CTI,
> >>> dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.
> >>>
> >>> Change in V1:
> >>> Check the dtb with dtbs_check W=1, and fix the warnings for
> >>> the change.
> >>
> >> So this is v2, not v1.
> >>
> > Appologize for the mistake of the version number.
> > Do I need to re-send the patch with V2?
> 
> Dunno, maybe Bjorn tools will handle this, maybe not.
> 
Thanks for checking.
I think it's better to wait other feedbacks.
I will send the patch with new version number in a few days if necessary.

Thanks,
Jie 

