Return-Path: <linux-arm-msm+bounces-107224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHmcMHsIBGpOCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:13:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 233AB52D79B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7C033014BDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2775D39D3C3;
	Wed, 13 May 2026 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpKJSi3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEgA01po"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9439A04B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649209; cv=none; b=IjXY6cYzdmjj9decwnhlwlPm4QHCwJ0vO1bxZiviokgn5gWqezyA8IdoavXqdK/aRuCbg1AvNzcQqxlvWCgrXPa83wfVnTU5CGhiTwB72Wpy6etgA/rQGt+3SoEXA8dwYDiehJ00cAaPM6wuhQF7BMcLy+89I5MlVyeeqEy9s7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649209; c=relaxed/simple;
	bh=pM2DGxGrkoKJcE0Bm07o+fMroy+qeI2cYPvBR9adGSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNoPHm79yxeqpV3VBb3QH/zd2lKkCccqXbJuEObgKOjxQcrSb1C+bLFDdPlDH8Kmll3sZx1oXj0PR5fa9ctGdqvQ+kfpsbc0RUhtumcijEBhNREVeF66XoupdSjhZey0nVm5rACcNRYYli0p/y/uQ6Z8vm38lOtvaTi3W0Ldtx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpKJSi3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEgA01po; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p7l42343948
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HC9njI7Ve8bSEzotMi0PMuJUNcf0jXH4lvEu4Vd9J0o=; b=CpKJSi3aE9OwJ9Q1
	mPX563krRDiFx1NVP6MCY32g4kWUSvbMlmjY3WuFoPXEHgSXRAJ8TtsWviVIkJxO
	cnz8nUwy+Y1RmzKLX+AzjtftUZHXo8QJWizUTJIeCBHjdeBcqnWF+Xbl1bTWkVdN
	hPYgOQSMqsuLcCj98iixQ5BMVY7KR0Emgb3EQk9jbXfX1lp6GzJuMd2stTRt+3EY
	FEnMCpsjtF7K0ExIyv3ZQfXnaTtqhMSNqHuiiWaH7SKxtLQ4zzelllKilqVD003R
	Jz01kOIQtGWxE2qRdX9l4PM+2nyxcLfEimrBV+AUa1NZs44TBRs3oCnED1is8sUO
	PhnA8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn3bn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:13:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc860066a6so29459985ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778649206; x=1779254006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HC9njI7Ve8bSEzotMi0PMuJUNcf0jXH4lvEu4Vd9J0o=;
        b=CEgA01poh/4pne6sLv9nlIPs50qUn+ANR6yeQ4zrGMTM80iC2UqA/us0SRynzj1hD4
         AcDnpWLbNFE21HsVvN9FnfmKgXMUo28vTmNVuWODRfm93fiLfaHXU4UH9DBf4TkQNjng
         sKdsb2Gk+Qo2A1OY3JU+/Adm8naWD7E+0PcaXrBXQn8FydVxfmLwgOzU5cb/Bsz9Yl1y
         DMF4xxSroWd/HxwWvsOkD6/MCvkYT3MKZsPqx+0bgAhONXrZ+krWyaZaB7xYedhuwNXT
         sxbUh0eLrodoKTHw7VT/P+//hM9r7YKDjZMvkiflCtwFGmj/uK6hnqgvlWFtgnprCxqD
         MovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778649206; x=1779254006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HC9njI7Ve8bSEzotMi0PMuJUNcf0jXH4lvEu4Vd9J0o=;
        b=EE6uIxjMUzlSgtUrInQspQKWAw+z6kVeAZH1t6H7qpYbAnIX/+xKHkdOTVaEdv5Qo5
         y3JrJ08SOcbwtm6Gv2vNSa9NM/EkMImjpPWFWSFUhxLBEpeed8dMQ96t/OgSQ96EEfjq
         fMQ11HDh8wTFQWWv4DxUAputAdbD5dGqewM3eSfyTeZGeelTkqXzxyT22Nqf9B6sCLfG
         UYRowgtJF1SnAFoWzK2aWlNquuwxd++eN582DIAY2sGxCC1ewpN65UG4CIyRh5097o8K
         WZ+diqH4UMkgsyrD8XIOiuAIWqa9755vaPD4qBYJj+1Z/H4skgiq3WxevSbmFa6zar7b
         3www==
X-Forwarded-Encrypted: i=1; AFNElJ+ngjIwTPTaQe/UlhzDfFvDy8vbSHUbDMox2k+sh5B623KKvo8/NW3Y29PlI91a2PeZXRazWPxtaa9MonZh@vger.kernel.org
X-Gm-Message-State: AOJu0YycsmHEP8ka+ozo6HwHvm3rBPJCLtwf5sO3VkUdVE58g4DrAcRv
	zdRbmHIkFjWy2vieMGV1PmhYawhM4NnJU+UuV09eAsirIgfKKQ8Nbz8j0xVVRn1T3PXXoA74qmF
	gGw4zFEcxkbpohU8REvIu6PSJtYCXLqFhi7Y8TVr6xY6wYiwZOpLCGRpVDkNFWodqK0pM
X-Gm-Gg: Acq92OGZ6eKkQFbTQ8e5Y+quHWaZKH02ec7l883W2AH/StISIGz3d8pbzU7CUeCtAtf
	NQSc973k6PnyNlvcUKpuDSBmQJ10ed5FDJlTxK+Hz/GT8Dxwg+0iQmf/DYfDfP0GQED6sFTEEII
	/pNDFPqMO+HwvinMeWSOPW/9HW8DyToNMaCWTH/FUysvn5zdSwRqo91crDA8P7mqNelvwp6lCcQ
	0vocoKk1N7F6+byWyytBUoq8EKXAx/ZSpTaEQOp6CEcJcxGwDNxJKl/ApfHQAUNE2I2EKOpi75D
	bPIrijGlrif/rKk8zpzMbK+hApIH+XWWQtLrC9Myns9FwkiD5y2DNV7dRnxL3Gk1xhcJG/KQrHU
	nKmHwBB3MvN5fk6uguWbmj6FegjQ/9QOMfb7M+jAuDs5XC/nR6AY=
X-Received: by 2002:a17:903:907:b0:2bc:e216:db47 with SMTP id d9443c01a7336-2bd2713c36cmr20428655ad.8.1778649206345;
        Tue, 12 May 2026 22:13:26 -0700 (PDT)
X-Received: by 2002:a17:903:907:b0:2bc:e216:db47 with SMTP id d9443c01a7336-2bd2713c36cmr20428405ad.8.1778649205854;
        Tue, 12 May 2026 22:13:25 -0700 (PDT)
Received: from [10.218.50.10] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e99be6sm146767155ad.68.2026.05.12.22.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 22:13:25 -0700 (PDT)
Message-ID: <15e8fb71-1eb0-4440-a8cf-26f19f66b2bb@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:43:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260511071024.3130247-1-priyansh.jain@oss.qualcomm.com>
 <06073a6c-1f75-4dad-9309-9bc47a2b4708@oss.qualcomm.com>
 <eab8dcf5-080e-45c2-985c-b0711185bed9@oss.qualcomm.com>
Content-Language: en-US
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
In-Reply-To: <eab8dcf5-080e-45c2-985c-b0711185bed9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h6_jqoLK0sOzY1ZUfpwpHVQu70xq6yRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OSBTYWx0ZWRfX4ykDYxjWqdhb
 ZXoKM4IrBvimKothFsS//Q9kzlBoCDQ15RUxZTuQMUfcRt0lpiMCYiLqd44N86yvGjb2s/2TeGO
 vVw84VPOb3mU23FBn8H1Lf+edhoTr31RP5CnmXTzPMk/IBUcNOvs/1i/lmSGGlZJyWn2u+BN82A
 E8XZ//dMAKATIBmbLHMhTYiGnFxD6qvd7SrQiF5mlDRRknQlCoHY0slblPYkIgSndLjPmUYWYvE
 H3zcDsYkUWcNyJv20/NWw6pPA3Bql0hjZGggznxGBf1yS4Nm3JWiNNgupYEqK40C5/Dp77rvqXy
 L3VLOwQxQurbTxlGAO6+qvPb5+ZH1oYPfze1QOLFwOv0rXxoQrBm9X/hRVKqG/+88O4afg2gflr
 +lQXN4TCN5qWYx7S9HmiO/qScuFyptRMKBv6JXtzbMnLZ9E7b6nHq1NjWnbFfPAT5xc6kxztvy4
 0cGlzBnoz5alD0j2GKw==
X-Proofpoint-GUID: h6_jqoLK0sOzY1ZUfpwpHVQu70xq6yRu
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a040877 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hyQ3UWTvvJBRuYoiHNwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130049
X-Rspamd-Queue-Id: 233AB52D79B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-107224-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 12-05-2026 02:59 pm, Daniel Lezcano wrote:
> On 5/12/26 11:19, Daniel Lezcano wrote:
> 
> [ ... ]
> 
>>> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
>>> ---
>>
>> Applied, thanks
> 
> and dropped because of:
> 
> 
> drivers/thermal/qcom/tsens.c:819:9: error: this ‘if’ clause does not 
> guard... [-Werror=misleading-indentation]
>    819 |         if (!ret)
>        |         ^~
> /home/dlezcano/Work/src/linux/thermal/drivers/thermal/qcom/ 
> tsens.c:822:17: note: ...this statement, but the latter is misleadingly 
> indented as if it were guarded by the  if’
>    822 |                 return ret;
>        |                 ^~~~~~
> cc1: all warnings being treated as errors
> 
> Please next time test your changes before sending

Yes, I compiled the changes without the indentation flag enabled, which 
caused this issue to be missed during compilation. I will take care to 
avoid this going forward and will fix it in the next patch.

Thanks,
Priyansh

> 
> Thanks


