Return-Path: <linux-arm-msm+bounces-106608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM/TGwmo/Wl0ggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:08:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A474F40FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CAFC8301D129
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E675C3168EE;
	Fri,  8 May 2026 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCP8vG4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjsHV7sZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CBE382F08
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231190; cv=none; b=uQDvZNi8EHMer5HB150f1FhRAx/+Rz12vDdgDOZ9gwaLm0y5kbqub3CdfhjToT9sMDT+pOBDvjYE0FzuNVsfr+k4iJbLqsOVNjQ9+GMhSuF18+A4oTHLkqlwrBbQur6qOPPUKWYbHdDO7K/mFqSgV+JceC4W8+l4WcNgasOEjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231190; c=relaxed/simple;
	bh=gf7iZAxz3wmx3YV+UD5NpwhKTbizFgcP3gza2UsZXK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdU1uOZetbLXyy1mEF6VGF4Ubyu6Uzyh+qFNovQpAKudF6l+rbEu+GKTkvzAYC1qigYScvuCISKMxNtKuRXvPJQJIY3lDwFodzfWnsI+oopk/ZvShEXtuPZZ8Nut3Tj9oissTAdjgR2m41sxHHuphS0WFNSTqRwjSk2Zn9CVjxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCP8vG4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjsHV7sZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64856JEq2183596
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azWDg4lbg6rRjZG0aZmL7inSID1cbw2W/ORXB2Sga+c=; b=GCP8vG4TahN4SgLV
	qfzee9B7I+k1Psi48LYQAY0tpJxoklO7tOT+UM5GTGQzV65alees9oehmW/3QAIm
	JibmjYUeiEFEcXmVFwawjJU9HWM9duNReJzUC+6IzAUCogMHcm1D/85uswCVTUHP
	LimAoXf1xJLHE/A1s7kGYFtW1He6aFNiO3a4b1JQneREXTkaPnakUCn42E/ZFz1l
	Nc+XCmLLpTOgkKo1/RrJYbz3UUXhz35+gJLypZ0Zord+BCPsDlMxmboYkYiVOcEI
	iVZQKa6A+hdDEtxmHKjkWhi3IwWyLJfjW0uRYHTr7KXq1Y5FIjM4j6X1Xib6vgkS
	QnfLSg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyam68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:06:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c823549b1fcso2296867a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778231187; x=1778835987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azWDg4lbg6rRjZG0aZmL7inSID1cbw2W/ORXB2Sga+c=;
        b=QjsHV7sZUWoZ4uwz+3nSvbIsxJndT5S+MnEhslSGriT3GZ1aUaX9t4B6DunZl1vD/8
         +DI9C5EGumjsL/jaKQKgU3hqLHQs99LIhfRnb5igghNklZQ4VXP/8TWlNwp3ScEkTVuA
         r7r2nktq1qSQt2rupYX2EGQBb579JjefvcHYlii6/3iLxaJr2/FsJRhSBUzLvfDovIBe
         Elxr4dpHwm6kPuVhD3t3eujCWuTq53r6Zx9ovXU1coIdk/bAx0XD0eaxQLwEEGN09j2n
         bHKyTQmz3MhtY92LYXVZLeBKGXdAnpg6ImxKyNnBZU9zs5txuytdyt2Feh5R3DCe0jXu
         hY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778231187; x=1778835987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azWDg4lbg6rRjZG0aZmL7inSID1cbw2W/ORXB2Sga+c=;
        b=DuoAJjfB0DbF2FyuEaZkOCHjpLnxg9CJUROckqsd+4ruQSmR8UCq7PyawAKHUenlId
         0BbDo2XbouB1EQIKsnqoM2g+lG4o/686PCOh0xgT1tC6gaoiLoKM+PjuVtpGYr6gBbEa
         I8jNpzi8ZMYM/lnzjyVF4IlhlYBXNNX6jeqb1jE6f3MXhXcCHynjB5oy2wMH7vBk9KlL
         tyCGTVCfATkOW1UQJ1cblAHE0hB1dY84vmmjF6jmW5Xme25FtjEsszvBf+fpEEZWnZ5/
         T+6PZs1jHxSt88oPF7SHBlfbh/U+PM8WP79gVbO6XKkFkx3MLBIjYGNPcRoqG/qpcCZd
         DHtg==
X-Forwarded-Encrypted: i=1; AFNElJ/G8xhxuesdO0i0yqMAQm15LgqdN4hzb3z7hUlU2rwYvQ1UtM9d/dEo1jRpVRB876m+kS2Kn30kCH8HldjF@vger.kernel.org
X-Gm-Message-State: AOJu0YwOlWLDCc8nKQ4U5Yk/sa57LCeLkGznaypSBvLGEgXPN0kpy9Se
	hk2kyIvvKU5JNBhL8MIthb2AcTLHlTB07FjMdVoZMO7wc4zo0D/mWdJQecA/tHksTDbu3xLd66h
	d1/GaKEqCMFsYs7qJxDucO6c6+9VrYPyFKNMMmnzNmlpdwV0zz6I0PjmzAh1OAzGPGRr7
X-Gm-Gg: AeBDiet62oH4vVF2nJkeTRCTmxB/OOseDUgZPYP1iCECZDhOwp99kOLiB8DgxcYhAN1
	MMyTX/9zkLsJx6HZizVaX47KWcte0rw1EwYCyhnQAo7BJuEwxkts3MWp+rrsLHmKoryVouQQsNX
	5Mx/zZDZskW/uym2RIDOOBeW++8EWZxpaXMM0okUW1+6Oen1vmK144YK4kf3x/Dz/SjtbxSdwzU
	qD27oRsTWvj6U5+X2KycxBwu5SF4rQKFsLvgOqN4KbTYRmU6LqxjorH2LlN4U5zpokZ9Afj8loj
	5G4Fhb6jscbRimAlHh9OYdP/ZmGKM7gxF69g7PPgwei5lbT0Nm7QUz0LuOk5XMnrf1fpJI0MJkR
	JKttM8/2no8pBtOwMIFS6tlwemd40aRyVYjX/vf16NIDy62yfhw==
X-Received: by 2002:a05:6a00:27a4:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-83a5e5528eamr10610500b3a.42.1778231187308;
        Fri, 08 May 2026 02:06:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a4:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-83a5e5528eamr10610459b3a.42.1778231186768;
        Fri, 08 May 2026 02:06:26 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm14582809b3a.21.2026.05.08.02.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:06:26 -0700 (PDT)
Message-ID: <1962bdd6-f12a-4fb1-adf8-af5de5d7bad8@oss.qualcomm.com>
Date: Fri, 8 May 2026 14:36:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
 <ybuup437mpu346fqhnmyuqkj6satxte47sxg25mipy6mn2yvdr@xcjlcbwf5gum>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <ybuup437mpu346fqhnmyuqkj6satxte47sxg25mipy6mn2yvdr@xcjlcbwf5gum>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fda794 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mg0E_8RrCHGhU8BAAboA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: NCY2wjJTC1O5K82iVEPXOPtDUGxOecxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5MyBTYWx0ZWRfX0IoZX3wRP4eD
 0YHVgcW0LF69mjRM7DtSfpaXrpEiBxLaw1lqixSoITgIPveMZZN3KwH1E3+5VwR0uqIptfN+Pau
 mkteJC4Mru8XeRUlIUj/8IYvPyi69ee37eCa615SA5h/3v07SMQjNYepUsefr/xkv6MHPr/grgC
 VJ/n9X/tVKxi47/rGEhKq9qPcO8l+HY+hIOoDR+wuIF9hK3EkCiIGAW7v1C26HYenU7/mxrH+Ql
 PCTNfuSOdAaeEIbbf2TPnHgmndT04tIB2wDD/nWUd8/YVwzjh14BshcooyV+ZcqOD2skOTiMM6a
 5vInhR8ytQULQcrOdVtWbRzVCWap5D0+Zgckk6kfd7mM2u/2uevhojbCJ4q6FNCzzqE7vdgRDjr
 1ZPcMVIM/98yibwpyspNid0/CPiNqVULnDI+sGcsPll1QMmS+25hsrDRtzPK0aOymSNRvEskeH/
 9eJ9m47Ruf2S7W+CCOg==
X-Proofpoint-ORIG-GUID: NCY2wjJTC1O5K82iVEPXOPtDUGxOecxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080093
X-Rspamd-Queue-Id: B3A474F40FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-106608-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 07-May-26 7:09 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 30, 2026 at 03:14:59PM +0530, Sneh Mankad wrote:
>> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
>> Enable Shikra APCS IPC support by adding the compatible.
>> It reuses apps_shared_apcs_data.
> This is obvious from the patch itself. Tell us something, which is not
> written in the patch. For example, why it uses the same data structure.
> Or why we need separate compat string and entry in the driver.
Understood Dmitry, will expand on the reasoning and share new version.

Thanks

Sneh

>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>   	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>>   	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>>   	{}
>>   };
>>
>> -- 
>> 2.34.1
>>

