Return-Path: <linux-arm-msm+bounces-76107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D6BBF2A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 22:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BE874F1A98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 20:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2142550A3;
	Mon,  6 Oct 2025 20:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/+Njtc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BD2D5436
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759781695; cv=none; b=eNlsSibcrk2irdJMwTpK9QQmuIVCrGa37jdhCSumqRp84a+tLkXQbZpNhO4bBR82ftuWRvQPr06uWRwhXYtiDtoqzHKfy+aUWe8PWiniVYpV9k/2v3L3OVI9Rpo8K/Ed0HLh+uUNdy28mRQRL0b7xGvKcFy0nWpMfg7ovAIjoLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759781695; c=relaxed/simple;
	bh=ltxPp9xcXdRhEJeCrKgU/q/mw7FGYyItT0yneJkV/XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkJHTjhKBcy0xDTLx/heke5vj8O3O9sorwLslRVut1d5VwWgZjcI7fPORX2+/Jto6VaOT8Li3i90onvIkiSpvHhddwbp9losBDg9GeFnorIie2UTSRlJXT06DI/dV2qCv8VGX63uYYTu/GKu7zKsi5UsM/TGq56oyAPa1YXAFB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/+Njtc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FmYZD016586
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 20:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEyKAN1vZzuHQohePa8sXUurcflNDuWo3yDRiLif28w=; b=O/+Njtc2P3rF6Ro1
	O406W+XGTHFJwHmHdNpSGhjKBHf1frLRiPyMtceZ+TeIhiDbjbHd2rQYs3daCyb7
	VOcF4McaQLwak02K05GWj/tZGA5fqvTBSxGZP2c+pE/pjaqSVG2ZDJYBXETN9wGC
	sK3765dpMRvPmTJDiN7XsJ52juo7pK7jg+tnv6V5CaeunaAM2x3vlVcZ4xEeJ8Mp
	lA5XNpN+kC8HIufn8PdnZ09pWqEp23zxv8cnMiGcgCSYDssZdZcWhVZKpk8385KM
	OJLG9zPtrbeOP0VyUfFnmuwPLA5pry0iYeHAkDCO3DEFWUHNjcq9C9sTUlKLQePl
	nb5ttw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jthpw5w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 20:14:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28bd8b3fa67so46785695ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 13:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781692; x=1760386492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEyKAN1vZzuHQohePa8sXUurcflNDuWo3yDRiLif28w=;
        b=af2b2X/X/9TKXbp1livj1UNc39M2lz04C0obQotOfcM5aLN4G8VqU3dZaLsaK0u/sG
         phOKiKVcfVOQH3qo1inWtyFsBul7J1Xg8bgwY2IIuH8fV9F90jNwNBwnQkGvXXFYYvpa
         o1CDxJPOxx7cKiknxOO8x4p5cBHOly6b/TDYOuTFBA60cthatJseKnYVEJ/yjPp9X3mb
         hhepGQ5/2p85Z+jQFZ/rKAegw60On0aYnQmO5znqnC8u2RP3jnQQXS3L4q51x8XrdcgK
         fOfnfofFHomLJsjy+J7MDjIy59ELeiOgI3MsvQDnfyC6lLpPhZ1UoroPIGiM9FPVvsyF
         V4/A==
X-Gm-Message-State: AOJu0Yy3jIfVwHjZslPkhdWLjnS6t4h3ufX64WvoSjNwzS4AGEfv36Qq
	zPZ2UJFKw4wypHVQZglGQVEvt/ICOJCYxecy0z8q//cqtjPs8imfJuRR99ZqKqK5pGLUK3PbVEK
	BKdcICtpBN4WX1Yo2sTB+FN6UcGdnQlCRNZ5RJs14bQyu1/v1+gBmUx0CKJ5x0Elw/o7c
X-Gm-Gg: ASbGncuOcPjQVqB66lCLxr7Qq8lRm0DJS4Ad/Xx4o/fyysOwUVkCzD0nJASGXx2p1gD
	tmoEdFSwUxPjwwVyvKXJki5Iv10NX9xNyKxWU6bRz+2tss9sqrm9GgJ/pAvIre942t0zXKnMmki
	9Ca0ZByB2pUaPZ0N/x8IpbGlv6S8Avxholl2/VE29o4XSh6p8waepx8MiE7vUoKEUfOmiiKvMlF
	2r/X5faHf9J15gW07Eevi3PEvmDwFKj0aq2o0nE4xYovfE5sJ1PvQazk7UuHbQvT6HBHLxRsrVa
	rz1d/uWrYu6PWKNG07R6b7fqxHujkWPWlSGRa+iBICfccLQKo2SOihwnEkb39xyNJN7EpsXRmVL
	JvbtUDy1oriupZkMmEoo=
X-Received: by 2002:a17:902:e785:b0:24c:cc32:788b with SMTP id d9443c01a7336-28e9a5462aemr167629565ad.3.1759781692096;
        Mon, 06 Oct 2025 13:14:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyuhuX8XSBXFG1NNSSZ4gnA7eVmFPYvb/qOVtcgIaGnkKWe/CMWBH2rUUBP8WFesCSxm/CbQ==
X-Received: by 2002:a17:902:e785:b0:24c:cc32:788b with SMTP id d9443c01a7336-28e9a5462aemr167629375ad.3.1759781691660;
        Mon, 06 Oct 2025 13:14:51 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b9e4fsm141410375ad.73.2025.10.06.13.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:14:51 -0700 (PDT)
Message-ID: <6b91d49a-37ee-4847-81af-a1e5b0b0d4f4@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:14:49 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Replace kcalloc + copy_from_user with
 memdup_array_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
 <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sK5QBVarqqQYIt1bhUbf6jsbnH7Y2-5k
X-Authority-Analysis: v=2.4 cv=N5gk1m9B c=1 sm=1 tr=0 ts=68e4233c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=MFX6GGzU5ss6K9bJXPMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNiBTYWx0ZWRfXwowJ6YrAzALd
 0lPQ9WHyjNVHKB7VlTFwLblauNBF+kitTw6IKh5Qkp0/Xoxlio33YAEok6idW2yvv3necsZK9RY
 6xFFUEXAEKaZp+FN+LE5bUYL1wnbYxMLJbVEa2q6avtXzQZiWm0r+frmeM4wk51/8H0xVfn9bSQ
 m4VsfvkMFlY852dWFRrEmDuX35kiQnhjDhpPGwitMa3sUmOAFU3UAl5wxiKUyxyqSV3iUJuQhwH
 TxRL+C3OBapBKirm0LEfrowstTHrmxHP4lzjuU1vul2iZRrNwTpUT34G9vEdJL5Cj/d7R++Dlfc
 df5lYVf5Hsp5Fmwxgb7MjueC5I2hiELbbqNe/s0LbHEzPUIrCEl8Wn95+z7eJ5qI0T2EmCl/iuL
 pSYMMPUJMkjpt/Odr+spxdsN2wh93A==
X-Proofpoint-ORIG-GUID: sK5QBVarqqQYIt1bhUbf6jsbnH7Y2-5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040016

On 9/17/2025 6:48 AM, Thorsten Blum wrote:
> Replace kcalloc() followed by copy_from_user() with memdup_array_user()
> to improve and simplify both __qaic_execute_bo_ioctl() and
> qaic_perf_stats_bo_ioctl().
> 
> In __qaic_execute_bo_ioctl(), return early if an error occurs and remove
> the obsolete 'free_exec' label.
> 
> Since memdup_array_user() already checks for multiplication overflow,
> remove the manual check in __qaic_execute_bo_ioctl(). Remove any unused
> local variables accordingly.
> 
> Since 'ret = copy_from_user()' has been removed, initialize 'ret = 0' to
> preserve the same return value on success.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied to drm-misc-next.

-Jeff

