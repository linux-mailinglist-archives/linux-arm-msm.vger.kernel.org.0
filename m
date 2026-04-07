Return-Path: <linux-arm-msm+bounces-102087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC3tAvXP1GksxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:35:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0113AC1E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27D7B30801B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028531F192E;
	Tue,  7 Apr 2026 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/LjdOZs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+dJsn1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68E73A545D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554309; cv=none; b=M8hc4VFMPuYC52eIYigNVnc6dkSfmNQoTsorOZScPtfJCciF2byDALku53xw0fEzmpLvW4917wSjKGQdz8XIjErQYVNlfFPjXkUaJTcgXajIplIRCf1bavyqxUKmZDyerCBZRblMuIF2VGJewUCPj2eV5IWPn3L86xvVHcsv9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554309; c=relaxed/simple;
	bh=WXb5hWfuZd1kYVDY+Shp1I/cov/+98/X8/kyL7XTY3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rmo0af0eueMw/SJ6IOz2/iU3OZqN7E/jTEzcc0VyaQEWc9AWGD+bUNPE/KPyrgtgCh1kbR0PLnoPqI+Q5/DftAYsIMtYHrWD/c7m1srxevsA/DycQAO5Kr4QuYuaZffq3hqNhTVprxyYIWGTh/Jzx5eFTbiy5z9jzi+1U/fwa8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/LjdOZs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+dJsn1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376i4sv1584872
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VDpzpJctBF8y00sVZ/9sqzDSyV+Lw/a4IOwwOhnYAI=; b=T/LjdOZspoCOcNjm
	g73mWr44lvKdbGir1t+FSbckqHzQUJ5OkH97lzlcfJIIDAPnCXy5cNurdKgiMSPT
	8CSdjoz7e+vfqIBDV4SQTLCqbvURzL7bXA0imLLnsFXb7xtcYKPXf1PLt2ktGedI
	X9+SdZ67Brz5QW+YdUAHCKz+Cgkhhf+GJLVWV6SoBrRpDUc7cC1bRi0b66eBf/Hx
	WFq1i5Ab1RBnvZ2Y43XkulTuTYjP1ZJcfQEwb2QYDrPTGg3MVw3kht7HBHdQEQNa
	ajjB1ciRyrIu6um1e+NCeyf8+sl5UJMY1zake5xkRmjqROPMR+/UHhhvQTDbrEgE
	GpUz6Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9t2ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:31:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-895375da74bso18891656d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554306; x=1776159106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3VDpzpJctBF8y00sVZ/9sqzDSyV+Lw/a4IOwwOhnYAI=;
        b=S+dJsn1uXuVICDhns0MCQ7Y/ZxIGeLMhwuu3n9r58t8wTkHUNTNQFC7myjm1WSzPK5
         4eFLjdJuXCDkqmq3O6wwCz1an2gOycHUj6pVWHxAHUEZa7FbD6SDRIWqRLfB0NhzCtoj
         ZUEjke4vDFkQ9HkmTWoIkb6i8dJLHVEbUkdgh0yR08r5Ntt73ww2Nggca8T7oW0imZHn
         47MHMZJeY0/vl6vmWKVIocGLu+p++88Z9ss5cmzSO+AnsFBMUghgzA4qMZp3QXxQGhIV
         Idx+tCpYs39+J7j1NlWzTvQrg2yf2OimpqGAkqqQMf/5330dCAfWDmmncXzLAdoxzP72
         qAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554306; x=1776159106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VDpzpJctBF8y00sVZ/9sqzDSyV+Lw/a4IOwwOhnYAI=;
        b=q6KzrGAfByMXFBmzonaHb76tNKy19zLFpu9oLnfs0ei0JhdR+vRQKfwVuqtLkOuJeL
         A02mD73Ppb0kV/RDpuJilXNhWYegsT4J5s2gireDNlrbT1Vy2ovaeUqsXJjmSNnoILUm
         wBvKRkvuuaV2f0SC2AiMi9gbn1MbLunRWrqYxtxteTBdEB5TOl1Lx1BP9nWlzUzTbyYF
         URNqI1eJpRyFyOK8Ryh4R/HY2wfYJ3RxtB7lirXVOtTnK+xzvJ9XuhsIMGecMUX4Zm36
         K3HHbWiUXpO3YjIV+P0ic8mvxZAUArp3rdNrZfexzrrDUpKC2iPl7qyIDeyouZlgQ4zV
         5P8A==
X-Gm-Message-State: AOJu0YyY8glcub1pjxQj1PIXxZR9StiFc+XMReEk7C7rAncs3N5s0tlb
	67Y9F2EfoaPJBnNCyYdAzVC03eYU9LDS3xa6QjhQnnAGbX/qwyWclWXu4mIAuf4SAT+PKORa59K
	OZ71TF32Vfzpi5qvjH8OtJXCud/NvafR929tIiGWCat8JLhpVJshN0IAO3LNCzhKoFeN+
X-Gm-Gg: AeBDiettVcceM1ipyoeT55F72hq2w7NVA7ch7v5+PQtkmMcROJ1nuGwnCk11S+zH3od
	wQY358INWx8TagN/9n3RQlIiGDCgDG6/dz+YPMqOPSos7aOU/av1reqSDfx4dH+ZA3M+A20K23k
	BbnJmd18q21jraYmfxLEDZejeRSwy8vnC5SGUyKzicE9pZ1nSvOnShoTeQdspGXGZKbN/Duw2vf
	ETn4DXP7DSKNfXTxCFf7sALW/2rdX/SrVU6WmTvU1o+9vtPwy/gmOduYWzYVfT3nzADBQ30dSnR
	z2/+TezRTfGY+yTonhDIJKwloM+ALdz5wf6a4k22xqI8DO4dHpdsBKms4JdvW2qxPm+242RCuG0
	raWlkNB7vMjRTPezuk+Qq5ZS/zSQsRcdH+oXVlP8fjQFYWfYHZlH9VAKMMM2ruCY7lCYC+NFfnr
	jBH5g=
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr187084126d6.1.1775554306022;
        Tue, 07 Apr 2026 02:31:46 -0700 (PDT)
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr187083716d6.1.1775554305557;
        Tue, 07 Apr 2026 02:31:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm533499566b.14.2026.04.07.02.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:31:44 -0700 (PDT)
Message-ID: <8723c893-28e2-464f-a9c4-2d4abc67491d@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:31:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4cf03 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YTqrmQZhOYAkcZPAGwYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX7KtEBuxMjlSw
 mgec8QNYKUC7192Auvw57heAJKDxVokDLeMIvYQ8H+snTh0dpSVisEcyoemk//k4lE4/b8es0VN
 NRqPFCXG3JItWxWc9HbV0nx1QdwJC0Nx67hSUuXhS150HXO+8lAnNJzbP2/kQaScgrU2zOzou77
 l0BuGg92ghM8Kwj03CFwklEYaMGRnIkJ/9WNgvR9xluqmxYcG7WPHBRf7ODs+g23IWly8BRhzTk
 sWWfrvmjEMmvoBhb80LmexyDodx222FZnqbPoXnJx4xJSdxHaG8HsK9o/k1+YWJTxAfHedpMIUd
 YhxL9VuuxA/k/7MA71jTmtoiG4Wtsy7hl9idGUJqsgBfIqj7cgVVCX7BL2Fb5g5CzLTY5BvxhEw
 la73iOxNoLMdtqcas0dwi9+Byz7z/LQb+SBBSsvPMAVjtN4zeGGfQNSmZF1OTbXMNidCG4eL+si
 33hnO8QO6hEQ6sDyv5w==
X-Proofpoint-GUID: vP7Yh8F5qdBTqwTjh2QlbVbHDYKC_sBY
X-Proofpoint-ORIG-GUID: vP7Yh8F5qdBTqwTjh2QlbVbHDYKC_sBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102087-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C0113AC1E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:46 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

