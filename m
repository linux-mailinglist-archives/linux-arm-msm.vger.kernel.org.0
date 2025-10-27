Return-Path: <linux-arm-msm+bounces-79002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA03C0FD4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 19:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46A5D3B00E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB40731BCBC;
	Mon, 27 Oct 2025 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgdEEbJU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCC431B119
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588111; cv=none; b=QTeilDhEFKo51ACrfMw7F5Zzop7VlkYL+ck0QPYp6GNoXNkPg+7oTv2SSYyyEqpKOKGzSN8/AzF/bgXvykGmuunHfhT874Ly9UmL29YGQJJyl4cZTukqvF05VwqoWHovBJJO8ruPjAMuoaXU72M2kZxqnl+aUZA5fmijGaxPccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588111; c=relaxed/simple;
	bh=BbsMERClaqieLsVt1uCqA+Z1Y91sZ/Vvjpe4grALUVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0RlLSI+DvGj4b8LWgP/26By8lA0Dv3XjgYcap0kls3exBuHA7SOEkZKJ5+k4Xi1orq3+OXW8O8YbgW/eZIJvBBcfjO3y5WjqlIdoAqYrcdGYCysVEm6MLy4xHarsImBiwNcpWmTs1OtoKieGDNyvivNHFFEty3sk/XUyH6lV2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgdEEbJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RCTwlF2752275
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfPIAz0ykJxRgruBtAUTEx9o9evpUFrEKqo1tOgYr2k=; b=CgdEEbJUCEs473C5
	d1c4UGXtjhqwhxB5CtiJh8vrnXA0M+BhZf3l5j0dLCg82hKBgypYZcewv+sDlG9d
	MXp1Nm7aZq21JtVnNheQBXaaJZY8YSYRzXC97Mq4crJy6w+Rqxtl6EMUuFOKJhTR
	Kq6MhM5zONXFAUiyjps7n5rGxRke7U15apr7xdJAfBIvibyWM/FZkpknuMDFjMka
	FAJ1K2Ri+iupc8JURTjScai8CHDO+hfEl9eSJO1SQEsExC+bFhufHzdBPW0NZ6IJ
	lfCFlRjNyHFF9DkNfPUjRKklyYV9cwSsQlJHBmCdGxp+R3lnIG/gV4qdfEkO5hcz
	Sami4w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swh4w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:01:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ceba8968dso3615482a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588106; x=1762192906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfPIAz0ykJxRgruBtAUTEx9o9evpUFrEKqo1tOgYr2k=;
        b=KxK8O7pQKcoFfOpGaNjp1ApGzTI9c4j9PvIdnEVy5MFcCnq6wa/oEbCpx1fi0yYaWh
         UVgW0n3zCbnnJW/gjuUp7RyERFJXejh3gNJ0WQXDhr/HaVfA5A/achYRplSzDo9zTMUw
         KWNg07bJz2ipdDU/MgcnoY88G17JtcmRWSnq5kncE24LhjEaXh43vC13uT0CPk8G18M7
         UcDHrF+8EpwmN9hNtCLe1z16Z9ic8XF7Wj+OEqCEQ/R56joMcnz7bL/MXi10BUaboqH3
         3vI/eNuOswOvCGitL8r/KYmdzcX+abWe35dGMQVq4Prudt6T9AsU75lp+qCPLmEQ6lex
         +Mfg==
X-Forwarded-Encrypted: i=1; AJvYcCWzIgV65dYizXQ4kPVLRfLKUiYzlzlR2BJXOKnLjG3MTBdLHGWVkrG7EAehDvBq4vnoq743Sp/UC5Js9v0c@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSGvC44gwIZmyU7lYk4YNUTvrfwcjcuBMmLuu14bIFMC0Ovpa
	MQAG6FpUAJT5/OqYkijBi24SHq40o++bJXGy1NnHos9cwJQiTXwZy77+gkFUwbt3yeupiyph7mH
	iKgKCI9xA/4RWQdwMtM3Sb3f0gc3fk0+ghUA2cOazTrzH7XFH7JpsAKOq0o3rrakOwQnv
X-Gm-Gg: ASbGncuCVRh1H+cX626fMBpHLND4H+vTMsV+BF6C30o9cQqRDXhuxPaDn8HCC6xF+Ck
	CVODugOcuiM6zzXYAA8hsPTY47OEkY/x2hU+QfZxzYhy52TrtjytSwTBt5zB0vwsmt/EnNR7vTA
	62IWtY8FgBhdlra+epdS8O0PcwxJMXqP21lKxYmGX1eFvvYf71S36kFl6F6AwFW1RuRtNRQD7Up
	3mmUFXlfDwtqzX3akiXn6HuUgjvZjsV8s7f8NwRYuyDJV6pPZi0DOcaF3tF4KtbnBjebUUW4fF4
	d5Jopb2gkrc7ddo6nDEUbFCDU8mP41tBVTXoqhsPdwrGrVg9M5M1QVJBrKpj5LJFeY06DMEPrw4
	c6jvB2IaWcjf5JKOaDm3j2IDfVfPcuC8wrVGLxyDWRqXms+VjWHlW
X-Received: by 2002:a17:902:ea04:b0:290:94ed:184c with SMTP id d9443c01a7336-294cb3b9d6bmr9729405ad.15.1761588105946;
        Mon, 27 Oct 2025 11:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDJ4c2LPoDw7uJI7bAxqFS10F7ZY7lTryaN9QQDR+vt8dbcxZVVBo5JKZYFPDu9xFxUVPrlg==
X-Received: by 2002:a17:902:ea04:b0:290:94ed:184c with SMTP id d9443c01a7336-294cb3b9d6bmr9728885ad.15.1761588105368;
        Mon, 27 Oct 2025 11:01:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf35a5sm87962395ad.18.2025.10.27.11.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 11:01:44 -0700 (PDT)
Message-ID: <4f77d8a2-cbbd-4e4c-b58c-ae213b0fd01e@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:01:41 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Zack McKevitt <zmckevit@qti.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8G2KcMLJk2ZhuNK_QjHqVZvSluBnKZpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2NyBTYWx0ZWRfX6uvjeo272HHB
 VrnYgW0ZyIeTu5ru9QeJXBeSZYEFu/YnsT9RXmsHyO+gSNqN0uAkRNzrpu/U/AJzmAVMYlBuNEu
 Ipl7EJFlGprOI+oU+At64QxSZCnSpEqPdkxz1KcDm91YgGMasFOWqu3r1AcCp1iTuADi3UHP0CD
 ujdZ8mHYhjCRMQFtA/Eh2GbuhzE2+aiii5z6FxMe8K0hvW2P5Q+eTlhxnMi1lV/duo0S1OyXMjH
 0emA6QaJAju3BnOzcJgUxkcP5IzlX9GX5FMEwLpL0cTeQfo9xOyrOWHRz6rQi4HISFPmajsFrXt
 wv1imRi2HJ7YjRhmNaORx5UPCmuWWe96PCDWOKGJywZGLIMvBNIed0ofEBjQ0Y6SF7Up1SESRWH
 0gt1akrEV8BSew7XBDyVYsvZnptqHg==
X-Proofpoint-GUID: 8G2KcMLJk2ZhuNK_QjHqVZvSluBnKZpm
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=68ffb38b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QoCwUzDOKqydt9tafI0A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270167

On 10/17/2025 11:34 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add entries for:
> - qupv3fw.elf at id 54
> - xbl_config.elf at id 38
> - tz_qti_config.mbn at id 76
> And move pvs.bin to id 78 to avoid firmware conflict.
> 
> Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

