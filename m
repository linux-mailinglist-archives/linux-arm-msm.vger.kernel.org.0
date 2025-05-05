Return-Path: <linux-arm-msm+bounces-56763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F02AA8FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE8316411A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5965F1FBC91;
	Mon,  5 May 2025 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bhEjKE7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2A1FAC54;
	Mon,  5 May 2025 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438253; cv=none; b=fG1fyk6rtNj+x9rxRm/+NIS1GJ5VA9QPs/AsH5VxxdK+pnK+J5JSSNfz0vLkaZOOXlclYOnzEni5sj/PEw1HCb8id8Zo+Zb3nxlbB3cBPGjV7sxVIEZakeSmM6q1OnAFJ4fWq8KpqKi5SAjl00gg740rmYvAXETW31hEe4KWJGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438253; c=relaxed/simple;
	bh=6XzqWimZXOsb8Yw2lc2DBQa2Q0GDKTLiVn3BQgcQhwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vEYgHJmL3L7nPEPzDV20RBIuvEXAtdIN/TWxTjirbFFlClNFiBpEqJzk8VDTs0eMIxQGr1ccFni+dIZytnssPbpNNKpjIvSPJYBfcIkDIGZrjlblqKzetW5Mo2tnTgq0F57r3Lt+kQoCB2cx2P9PWiHsgvIAjaxz+Gkry24YRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bhEjKE7Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451Q5wx031613;
	Mon, 5 May 2025 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCsFAWnMdYpuZtcmelfSoiOifJo6ZKpE/jmJJ//MDhI=; b=bhEjKE7QnK7Lw4bL
	A9j3ztODSCsz8DOICy6fNnbELjRVCXSzH+TYgtFDoX4Ms4SX2ySaqttg/YuZXmJu
	BUOXMhkAu6YxOVJC4bVrP4eIZQ5tba1fb4+OVBPb8UJzvMWDts9Htu9d95YvlXvs
	lW3ItF3gaxNgapU0+zFxq9bN1/G3ZUws0Ut8a4Zgj8lgAkWJJUJlduVTaYKhgdwu
	ZtQn5dgTRZxZI1N4KmoZ89VT2sfwgV6UH6ma/X6K2wnOjAmjvoE07x7wsUrMrPvf
	sZcL3T7jcyUp5ZZ6uLofzSdLDJ/RwU1crwkCQHHe8nqGbYiqCe1j4h6TfuPsEhvs
	7ZfAog==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xst60p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:44:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5459i5RL002786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 09:44:05 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 02:43:58 -0700
Message-ID: <cbca1b2f-0608-4bd3-b1fb-7f338d347b5e@quicinc.com>
Date: Mon, 5 May 2025 15:13:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-1-6bbb514f467c@quicinc.com>
 <20250502-singing-hypersonic-snail-bef73a@kuoka>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <20250502-singing-hypersonic-snail-bef73a@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G0tL40oBdWG6kU691Fr4jmmJ-2UCcGMd
X-Proofpoint-ORIG-GUID: G0tL40oBdWG6kU691Fr4jmmJ-2UCcGMd
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68188866 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=G7jnd7fLqSi-iU_Q12IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MiBTYWx0ZWRfX5QOH0Wo2eoC5
 /ghU/dsJLSkHbMJiRJix0fLvVzjRzcoo9qHSU5lMTu5Xiiloeq5cuNxFNlM6cy4CHiZWD7ccZZG
 QjRzdBnEMiRHM6Uh7duYhP6loZl2A8ijPuqAvb7vaCxzAMTCNKbMVScmKkYjb5yvVeSXBc529RC
 mJIMZgIln3YoG87hrqXrVZn53jLj5QCZqNc1Vz7tSgx6lq3vm9Rv2K3UDyXOd/n9wCaZ03tykfe
 Oe2VAyP9EJp82xcjPsrJoZ91E45eUvWIJ/lZQQtnSIbARsX6LyENVe7G1ILmwS8wCnWAtny1AIh
 0wn7xuHRZtDDOCY10NwVpuDYne8VXumiBGf4FnaRdWd33eccYD2xjzNnIQ/iHqlNntbCZJJtCAb
 NIZ5pQticUKWAn+xQzg3kftKr19aG4efofILocsbqq6kNfNmIxiJKrSeVVIsx/mokZlSFTTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=817 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050092


On 5/2/2025 12:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 30, 2025 at 04:08:55PM GMT, Satya Priya Kakitapalli wrote:
>> Add all the missing clock bindings for gcc-sc8180x.
>>
>> Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
>> Cc: stable@vger.kernel.org
> What sort of bug is being fixed here? This needs to be clearly expressed
> in commit msg - bug or observable issue.


The multi-media AHB clocks are needed to create HW dependency in the 
multimedia CC dt blocks and avoid any issues. They were not defined in 
the initial bindings.

Sure, I'll add the details in the commit text.


> Best regards,
> Krzysztof
>

