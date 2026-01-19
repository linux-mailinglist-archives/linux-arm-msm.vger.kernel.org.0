Return-Path: <linux-arm-msm+bounces-89613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B9DD3A5A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E9F43002D32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFF1357724;
	Mon, 19 Jan 2026 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU+nREVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKCiTkGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8D30E848
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819814; cv=none; b=KWcn+bXggswB8XQpr35luBV4CIN8abzhgnPaVVMVd1awg+nF7yCg/ADlhGQPn7ZjXHwnCAx4FuCFdov/6bmaCAfwKcRlkWfh1E+EA9NZGii0iuhaWy1g+MWDAvDGTDVXEGavL3RvnmUqPI5RAEyp7Axc+cORgbF4cEqgmb0Hr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819814; c=relaxed/simple;
	bh=UWxsxlQPWGgXq/DOlhplQi/GnONVR1tj/vYqqBMh/aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FS8l4HSFAkV//61DbbeoujGAlde7Mazt8iv+VuwGYVPnyET2yXVophM7rWcncjdES6kKAXPsWWvucHBik6XythxTCgvydb5QkJgLCYTzxFCEqZB+be8J4q/U1Wa29O4WBWnkTeXCRPbEOGKAzW/1nR2flm+oHqmkNIer9pjdswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU+nREVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKCiTkGc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91GgL748359
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9dniL5q6VIDL4TJ7kyGbe4OF786E/8Yp0h8WVC/iQk=; b=KU+nREVbcpu+p5DR
	Qayru6y3UjQn0c2L9RhQwZA7yFeJg1Ux42i52IqwKKAodR/g8Q60neOpDXqwJDj4
	wubpUNqymreWiMGTf1VkJnhyBJWNM6G00sKoyS0G4jPjPtaPkFdulHTVQ0CEmfA3
	7k+WQywA+WyG6SYfpsFkP+2eIRFwwFVWT8UDMI90I0Ar/aGb6zjXvCg4O+obtpFf
	661Yh7KsoZ1+rdfs+B4gZ8WsROptRg9UpKLqTzba01Qo7lmCnniZYNulrjlsjnnS
	Xg/WrmEdwaLZSvKajfH6MzgQzbdOJEYY8fhTPDrxoW1Z+yyzFF4e/H6QDJbuLJ9T
	PmekTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74rpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:50:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c231297839so94684485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819811; x=1769424611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9dniL5q6VIDL4TJ7kyGbe4OF786E/8Yp0h8WVC/iQk=;
        b=hKCiTkGcGjsvlCUteYC+aNtm9LaRVKRF8OjXFocMDG5dp9zv81U5tptAlKr17cDRfa
         v5VASey4wWGbJxiFCHUBGVmGDFrxEe6qYyd2HcSa6Bl76I8EENF3HY6rfElZzdLGljMH
         UPf1jwism4nl3YC5ACnrvcDtbjdmNWF+sBzGgun0d/yD1pyryi6ah/wIBaiJKFbYXzJG
         P180BMVi1Pcbk6+DdVlkyKdazpI6pU4obs4HsrhltVNd1G4SnXFTLqXGcLdOPDtfcBhU
         hvVWILQrYn5h/I/rUETVNeskwsO5lhKGRgAjy3SsjfGZH0fF1UZqqrnBcbiaY3jW5+OQ
         LVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819811; x=1769424611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9dniL5q6VIDL4TJ7kyGbe4OF786E/8Yp0h8WVC/iQk=;
        b=M1kXr5nBNgzO4WEh+n8fNt/CrQ3dtE+BFS6GmxXLFk3vbAuZNNsnLAnAlOIs05mVz9
         h6VwIlfaaI37pVJ7/liYB8SUpc/SAtqr6gsGJ1cH+5/IAsTbaIr0zvEbx05j4u/Emwjy
         A0e7xCkupSoQ2mvHRXIKxGgpwVqr5YdQNioT5YokiCJqDV6HqFRi+78MK2DSoGY4dS2L
         2VCSAIV0fFV06zJn2DauEZJMszRDoIspKKRGPdutkEfTbzqhaf/sXvuo6kMbUdKjAAI1
         gtS5Topp78Pn1WlL9gBjEW4D70fk3nH5lq7Niwnft3+bwPqLNHXsPrrOKHmRPiCNS0CS
         pNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVakkkoFqH12ckBgawMK2UsIts5KqKkFz0CkTrujZlKYLEl1INsoG7SRQo+khM8Xs35RU5bLGGC8p7f1UeS@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpbNrg+NPQFhQORTghNgjkK8N1AG97xWnQFa4hm7mOvbWzROc
	sFdn3Hc7h/6LFYxkLaI8Xj5rXZ7Nz6PfvVaTqplzf9XAtShMeNBTfh4dt7OoZtQfGq8IEdTdgiD
	wQ8oyWBHFlInY1yRQczhkCPKEVQwCy7mg3exM4xZ0Q3a6lTaD4o8yJAr/fibEpcww4rd/
X-Gm-Gg: AY/fxX5O14m1HwvMTdg3h5I+tzI+doA3mu/s9GNATmuT7ngzzOtcdjbsndw85m0y7Lj
	MiyDhRG4h7xqkTmmg5+iBkHRqOgHUOa78EuZbkbHCTojE8kWrTVxRdNxG0jVFoRnh8GqxioKHJf
	JsAefKFUAVqBcfR0MymOiszj/Uuh7p19/GLseQl35//2t8GwcKGfqwKCQ031qMSja1apheR2pY1
	Ei/7gCHSTT0evdQF3/0La5iaua9GKaD9PWY0Ade+qUdQsCVevOQmCs8YwTmbvdO0Ohn1vTWFbAi
	AQiR6GFZI+i7P6Za1+2+aH5O8UMpeOTezdmzD19TPply+g6Wv+s00dR7yY00rr6LnTvvGRSbhm+
	frAgL8ydMFxd6T0/4zUST8bXSAmYHczp3P+fn2f3foC3nVB+T/M/rhHj6KWN0TKMpPnw=
X-Received: by 2002:a05:620a:319d:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c6a66e36efmr1210480685a.2.1768819811095;
        Mon, 19 Jan 2026 02:50:11 -0800 (PST)
X-Received: by 2002:a05:620a:319d:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c6a66e36efmr1210478285a.2.1768819810597;
        Mon, 19 Jan 2026 02:50:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e63dsm1054358566b.14.2026.01.19.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:50:10 -0800 (PST)
Message-ID: <e4761a54-a172-4dfa-9223-0013913bea08@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:50:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: qcom: Add SoC ID for CQ7790S
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e0c63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9D00k2bvbMmwnaV9gCMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mCCptKzNppatg4_TqZl_gdoYl2pe5ir9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OSBTYWx0ZWRfX+7YxtNLin0+f
 pTEDg56XHj+6nGvqXBVl008x2iCZCWVIM7FvGz1XlMzkmU66NX0OBubisk2hNguLY2dd4YA8iWq
 Zb2ALqLDN672HRZ6VzWMpgN87e8OrOH4zU+0+N8qXyaGF6wBkJE20Hcyb0msAJw5QiDE6ypiy6c
 Wtr49CZuHx0T6l+0ubZOq+cYdVcj7T6Rn2TzQvWkm9P4330xkx845cyQnfQ8CElR1xKmcuVLZf/
 UajztvVzUc0X3zvKJS5t63ltRhKeqIZ4EZx4rY678v4To/pOC4U6HwhLY4JaW+a4sDSANFOb8Fk
 OyG3XDFSBiQqFTZCBu0zv95fz783iHTzhsMaglbx+GMw6YKLxohCAlemdqb18s6QYVtCLd7qv4C
 Eq0lTdDf/R3Xk6K6RuwU6kQaQ96eemCJuzv7X8pzBUAiYcXhJbc62s5YDr6q0ft+mYVKmXS4iwr
 omNpgMFV8ibrLYVDexg==
X-Proofpoint-GUID: mCCptKzNppatg4_TqZl_gdoYl2pe5ir9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190089

On 1/19/26 10:59 AM, Krzysztof Kozlowski wrote:
> Hi,
> 
> This is early and first/initial posting for upstreaming Eliza SoC, e.g.
> CQ7790S IoT variant. AFAIK, there is also CQ7790M variant with different
> ID, but I do not have such hardware, thus only "S" goes here.

If you're sure about this marketing name being assigned to a specific
SMEM ID, those *never* change after they're assigned, so it's fine if
you just add it to the list

Konrad

