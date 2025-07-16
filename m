Return-Path: <linux-arm-msm+bounces-65291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F624B079A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F292E7B271A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DD82F6F9A;
	Wed, 16 Jul 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTl83bTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180F2F5C47
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679288; cv=none; b=icYW18Z0Oxn0eKKc5aiw0uNtuuOOx11vEJEbDEGEUClqUnSS9h+OiTxPvOWwPjcaCfc0cLExrMTiO05np76F25lyOxJHOyjigNca5eI7UcqdSf35TOlB4n8BuQXCmKRBWbHccHd5Z5tgT3avuabdm5/w7d2pkaaFTijo/Akqyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679288; c=relaxed/simple;
	bh=fqG7B+T81R/Frg225wIMjY4KZA4GxqPDhh4R3ITn1qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBnPXuXrXIs2zkPK7hh1l3EBv8xEwWI9IYcOsqWKlWGBUTxVGdxHWClOlzwnlOtynCWp/Dc77cIzGf6MUzUVFYyrPA7TWtT5XQCX9l4AOuAZAge6zMLC3P3goGQCxxJOS0BJky8bm8Y9IP1KQnicRKcp+KGKlB/fXpFveD+JO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTl83bTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GC8SV6019212
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1bUnE3yh/20Ghd5aYHGrfLlbtIsqPiIKnsI6KRLyQjk=; b=mTl83bTptn7jOjj1
	YljHgzUQtkN3PYRa63msvRQktH3WO7HRs58VbyD+6CIPoFQShma+bof1Srfau1vh
	E8cTHyOcBLeOymJiZz9781O3UEo2D7Ffeo7xvJZuSWS5mztZ3XqPJn6kcxOWpEav
	ckPuTztKdhdPgmHhQhifhYsonxfr77owcXbMSJ3IYB6jtehRI1scdz3qf6DZY7Lp
	vECtjuj4n8irBB2TyadW0RaAIJ+XK1RsIh9FS0Q6RcMe/WTjIyoWVmBpE9mVIQxk
	s+eH7uDtwFIKzDKbF03szmSAMB2TG2UupsOLtPlLg/fAw4LGufiTwsxb1w6gzdRf
	efS8DQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsq8nmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:21:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2ced79f97so46715785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679285; x=1753284085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bUnE3yh/20Ghd5aYHGrfLlbtIsqPiIKnsI6KRLyQjk=;
        b=BywAoyy5gd7jejd+uJAr9DAgtbH1sKCc1/E9KLO6YEPv04fQpbkIg01BuYaIW04r1X
         SJdt61Aof7dbU0IvaV5CAgRaARDULYZpS6wSGyRP9SAKgD7cHKsMpkbG5BeGKliuHLAR
         NWiXpBDEfnWfqQCx7uJgTRh+6YIigJBFld+zgGuHdgHj8XrR+MRq9X6YAMZVA4NW76gS
         4yq3Y11+to4mB5RUcafzkzcwu7P+a5WjwrpgC4OZ/eVbE80fHhymIbX6excSuOKKVtAi
         j3P1Mmc19nnwZK48WMnHRlVLR4wDMy3WwQ1YAj1E3cioLrnqpmlZ7hEnIhFhIN2KuB28
         6JTg==
X-Forwarded-Encrypted: i=1; AJvYcCWxXi/CT+KjGHNvbddBvxtSqVN3r5HSd+mJi90L8QK6lnzxnuKFKhwLhfKidvZtwH4DdM8QTNlUr06XYdmG@vger.kernel.org
X-Gm-Message-State: AOJu0YwzWWzkoz76xhL2/Iu+dq54Dg4iaIY/2NEeI6Tq2RWsfjt6bLHp
	jwIYl6FAZ03bWNRn1iQSZ6w+0ukiDS/oGDfPnun9DBhQk55MG1jXsxKgwEVkjYBSuCZxvXLGuhb
	LRGkEtR3CauJQ0jh49k6Fnr+pmqeeE0EWDxUZvGJpcboHeXcUQ46pMUFGctf84HpU2bbw
X-Gm-Gg: ASbGncvAIYHGdYY2OVcp8OvpuXtQ6b39+u0V+WpYtzF82PUXL1ta0C0t+uUSg2R2fHH
	GNAJggsd4lCtq0bGc4J8e5ae1Kekftlsd2OBmpM248CrBESEc9hsYzQpI4n6f50SjvRZJnag2sk
	FjcBD6RcpVyDLZSIMSRTivjQ/uLE2vxPiCkOi8P/eLLf7KfTui6Jr9/ZBmSzR5XYUPg+dI5Qp8/
	bSO3ndiL0NTE6lRrAcSZjyVUnElxHKYMSru154FB2ajjxjQNqjjMvd875LIv7md/0kNloTzlRAI
	s0nhUENqJaHNdDXD4DU64cd6QU7qEdklIcS+fO0/PexlxcjIJEQpcRaS+qF3G8B+/rrhUzYGxlg
	iA6dZE+54xyF2U8Z87K4X
X-Received: by 2002:a05:620a:1a27:b0:7df:d668:22ff with SMTP id af79cd13be357-7e342ab1936mr216253585a.4.1752679284869;
        Wed, 16 Jul 2025 08:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwUL4aOiOFKQWY6fr2mKEYH24z1mhZ4m8g2O2+qGwqBgjEmZmm+7igGSQAEYX3auu8FEpU1w==
X-Received: by 2002:a05:620a:1a27:b0:7df:d668:22ff with SMTP id af79cd13be357-7e342ab1936mr216250485a.4.1752679284383;
        Wed, 16 Jul 2025 08:21:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8291bbesm1194624366b.126.2025.07.16.08.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:21:23 -0700 (PDT)
Message-ID: <9075ba23-cf47-411a-a6a2-96f89114b14f@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 17:21:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
 <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6877c375 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=d1jN1tAPt5WcxSkl4i4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EXftsxHzLry0BBkqBas5j66ZZKq554RC
X-Proofpoint-GUID: EXftsxHzLry0BBkqBas5j66ZZKq554RC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX+fBW15zL34OR
 GHyVZI0F/9reIqSZMKo2oIz8DAYw7hxiBMOB2tAYVmoic+CSMMI+EUOKG4LLvlUkjghnFklveO6
 MnadViSI88agQU0PLZ/8PwVWBVep1wTvAK4azcYqlHpQFIxTWpCp+NNFtM60PWdSn3wFEotmueT
 wIRG3DGRTYubDHfryfajfZ/f/Wut0AuhqxWAa+8Z8TfXNhgm7PDUq3rFodKOF0qvBbL1u/Tpiel
 icnAoB0Z2JrJiMjEKDGUwPOVujIEFlW8pv0607RwliiCA0Bx3SkP74u8b0aXtvO6+7l2F01h71R
 Y2o1ZHA0TCn8nCqobWteAdlboMXVX7jKdtN1/Fjewqz4NYWRx2Lf0+F0Tqgvva0j1OHWiA+FA9m
 osK0SW4Dekj1Ppi3BU/DA5wgBDsVnXPCCWjWfKzR8n0vnSs5hodlOD+0qPuQ2mpWER8hYzKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=767 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

On 7/16/25 5:00 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 16, 2025 at 06:58:34PM +0530, Ling Xu wrote:
>> Domain ID in the uAPI is misleading. Remove checks and log messages
>> related to 'domain' field in capability structure. Update UAPI to
>> mark the field as unused.
>>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c      | 14 +-------------
>>  include/uapi/misc/fastrpc.h |  2 +-
>>  2 files changed, 2 insertions(+), 14 deletions(-)
>>
> 

Dmitry, your message is missing

Konrad

