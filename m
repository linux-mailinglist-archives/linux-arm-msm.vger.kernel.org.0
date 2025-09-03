Return-Path: <linux-arm-msm+bounces-71814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDEAB41CBC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 974116820DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A62B2F5485;
	Wed,  3 Sep 2025 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SeAALVaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FD2F4A14;
	Wed,  3 Sep 2025 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897695; cv=none; b=sKlXLfIL0xQsrOQM040EhKQ90yU+QxG52SJcdvqLh+YeGGJE47xb7Kga7qGiRP8EfSe8DQCgRrDzmdx5qhUGoyKafwKZqGARPP2HeEXKY0rkvKR2fsw38wHAvVvbl6sc/YKLq04Hp2M6M6R54U2MxTEQ+CCHnhMrGxUByX68Dyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897695; c=relaxed/simple;
	bh=hsbplQXkIgA37YP5Hij+j9CljYvH3aawi/l8DPlQ+b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D/BePKOopCkEeD9XU/pxGNU6ey7Xd1Fk6fKlUcg6rNPQ6m2p1BWfLGby0iCLcobfhWN7vC8a1Hps1W9JBQtAvL/3jg+Xv/Zzpbj3WrbIlN7vo/HR9z1BZgFY/i7RNaRY8eE0N0x+hMYlnLUKGUfBJee5waq3yhHv9H7j4E0Yj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SeAALVaf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AQOFT032191;
	Wed, 3 Sep 2025 11:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nx1aRmTFwve7HbtAAO/FVUGNc41TS5u5EKcY/Z96E0k=; b=SeAALVafy1aL0qod
	1g/XgCg8ghWMnqU96q9xOARoombDx+SkTF3Q33g01ycxOPPvCiypLQGHsTel2qB/
	hS5eSh3bDAxl5ANdspit6G1r1QmJhfdwpSLZyaIxdRst7XSiltLlr0UUaFu1hIYU
	423jf7vLkyOfNVw/H51ObRfCxZ83t6BPPHZwYvAWwe+dXMLpAMNpiOPh4pQtIRho
	Pf2Aay+s9P+hRQnlNg7b/BQP20nnJ5U8wL2Xm/zabSkZr8LifEc0vO2G69olAXou
	u9WpZhyROb4Lxlxb/67VCGAySaLhbQwOM4Rrd44Wm8Caw9ga4oj4cxQKPKKaQZxk
	37zZKg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ubh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 11:08:10 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 583B89UA028316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 11:08:09 GMT
Received: from [10.216.53.8] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 04:08:03 -0700
Message-ID: <1f77c650-3b09-580b-e3cc-85afca056160@quicinc.com>
Date: Wed, 3 Sep 2025 16:37:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Monaco EVK initial board
 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Viken Dadhaniya
	<viken.dadhaniya@oss.qualcomm.com>,
        Mohd Ayaan Anwar
	<quic_mohdayaa@quicinc.com>,
        Arun Khannna <quic_arkhanna@quicinc.com>,
        "Monish Chunara" <quic_mchunara@quicinc.com>,
        Swati Agarwal
	<swati.agarwal@oss.qualcomm.com>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>
 <ao3nb3xkeutqetqx7amlfbqtvhuyojfvzm4prsze2mhgb2rpnc@s2bsigcrlxzo>
 <26faedb2-63ca-e2e0-aad6-49575a8c49bf@quicinc.com>
 <j3kuygqqymh5pbujdum4tc275fbd5xrhejry4c5spuivxloon4@zrqfuqtydvyf>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <j3kuygqqymh5pbujdum4tc275fbd5xrhejry4c5spuivxloon4@zrqfuqtydvyf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rV6Pxi5aXBdMZqphX6sEzVBHxi03iRlb
X-Proofpoint-GUID: rV6Pxi5aXBdMZqphX6sEzVBHxi03iRlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX6QFWl0eJDqrT
 wmTLKT3ohhunIYKNzmca2LA2PCfJR17LMem/YxAROcwnUjEN8hcp5fGQ3RrLhper/3i4b7Izg2n
 ZmPraLB068B6OHgJwn44SMTnGFz5N1ClDOLulzRuTZUmPCzHjoJGXcRIe0DhoiWRH/4icvk71MG
 XUiBVTqQWTED9J4BdIAJiVW//DQbRMECo9CmUBgavNhwB/TwEbFOmWhrm69zqxSmugEzauFaGyV
 4udgBzAeLjRrKicm5W15nXzq5ueDkDlwhhPI7mn7JyIooMghL7AS34jeBaWKBDq1euZEbJoU1lz
 3TMrQA0nCqICBFbO49fqyfzCOaJ9vKtUDHpXRYyMun12YKi4koFPXyDXI1wU9AG7EAS8O5H2NeH
 SO1X8LRC
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b8219a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=DOWRbtWmwZy1LnYVOegA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020


On 9/3/2025 4:33 PM, Dmitry Baryshkov wrote:
>>>> - Support for the Iris video decoder, including the required
>>>>     firmware, to enable video decoding capabilities.
>>> I don't see firmware being declared here.
>> It would pick the default firmware from driver monaco platform data.
> Yes, but the commit message says something different.

You are right. Should be updated in the next revision.

Regards,
Vikash

