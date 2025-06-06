Return-Path: <linux-arm-msm+bounces-60447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C82ACFE19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F03EC1894759
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 08:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31408283FE8;
	Fri,  6 Jun 2025 08:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QMUcANEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF771C27;
	Fri,  6 Jun 2025 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197893; cv=none; b=pW/cUBb7qPCOcWvm93tLxB9T57hhr6kQXgJFecnYCrePDS8eHeAQ7IjaQZRXiUdWlsYVBZMPavXmuOUpTs5n/b0gx/RawOEQZfVTzbxTWZmPggt9Bw1sEl+xrtWnIGZmfVmPtiuA8XqPbmG2QtRLo1iK2fCpEouCkwkphtnOycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197893; c=relaxed/simple;
	bh=E24qRkhsleKXUtJgi0UGgXe7Q9BafN+sy4FPMlQLtqo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heS4N5kzQHFsUdeILMfoMxtUWDkeN3kVxVxXPnDYrFJ0hjOxJWODIba9vWfcljlXSMk5lEJC9NfEG7mHeIM6QEIr66QIUrHPwIQHvDi6fnt20iy40PsYlFt6vwZdHL8chUkzezw6hpm7rKKkdobqulrhQXA+GvPgIWfYHrj2wL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QMUcANEP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55669mYe000728;
	Fri, 6 Jun 2025 08:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdbDa/fryTusveJ7J3y3Ekjc
	84qti9Y57GWqgNEp7M4=; b=QMUcANEPOD/2ZJy4Gsli/XvPeHLmWu3hj1ruKdGB
	nIbM6R6b0oyW/qFnN3EsV2UzR8GqMMb12OkV57H98ALZG8uiIThlkob/GBviC84m
	9ap4C1R8VK8aVQOZPsEnCdZK+6wF+dTWDDJEhdTLsAcTLvj7mmVty7lEG6M4r7ZT
	e3HGwBuWlu6dU0Aj2vpqFfmsBx1B52s2DI3TRAJtuKs/OWjIx9SRdjyYcY5rzFHB
	46x84Ncbjj8I30JmspKiR2kB5GIyqTNnE6DcMylCiyK+HOMFFOuafM+8tYw9/pLK
	azR22ItpMkQuS+ZO8aC3hbmB5MVDPIn/t382pOXneMyTRA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qbynf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 08:18:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5568I0UI020832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 08:18:00 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 01:17:58 -0700
Date: Fri, 6 Jun 2025 13:47:44 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] remoteproc: qcom: pas: Conclude the rename from adsp
Message-ID: <aEKkKG43H1BDmr0r@hu-wasimn-hyd.qualcomm.com>
References: <20250605-pas-rename-v2-1-f1c89e49e691@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250605-pas-rename-v2-1-f1c89e49e691@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: THd6-SZ0BA4CqIo5bFIdmgmHko0xNORh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA3NiBTYWx0ZWRfX+dc/An1ITf8Z
 7wfsbTdWLj+4jf6lliq0Jlp8/RNYo+EYnRFdmyFV0cHgy0VfC13ZZgFLnZYEzBawn9oAxxunj9E
 9H9NqNVHbxwI24c2zDXYvAPMTiTICbh0/6YWJzORGOmniAt3iBMIETwoszyU+XFpSKqWaak/nBf
 Tp17HiISqg42xsyHLdLLsCxEO7OWYPpH9GDQ1L72ksx2aqc3DxXEs7UqOAyIzOW9T0pFk5ui5m7
 WjHxbEkWqWEhekvFzpydvAccF7ZBS1JIKDR/U1qBvGuds704noaArUUI9ICLBkbZbXYc0nAd34R
 7xN4/YGw4OBrlJmj2ejfms64BuQ1jl2zb+CUDY9rbueDIcMFbQafLkvwmAt2YjtQWSzsBey1yB4
 3iwHPmf8V6I+JyT/1gqMhmJHfYY9opS9goelAeu5R8zfzQvA3t2w56Q6n4gBqs/nN1J8I82T
X-Proofpoint-ORIG-GUID: THd6-SZ0BA4CqIo5bFIdmgmHko0xNORh
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6842a439 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1jkivVvmW3QYzkBJvmcA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=483 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060076

On Thu, Jun 05, 2025 at 05:17:47PM -0500, Bjorn Andersson wrote:
> The change that renamed the driver from "adsp" to "pas" didn't change
> any of the implementation. The result is an aesthetic eyesore, and
> confusing to many.
> 
> Conclude the rename of the driver, by updating function, structures and
> variable names to match what the driver actually is. The "Hexagon v5" is
> also dropped from the name and Kconfig, as this isn't correct either.
> 
> No functional change.
> 
> Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Wasim Nazir <quic_wasimn@quicinc.com>

--
Regards,
Wasim

