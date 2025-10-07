Return-Path: <linux-arm-msm+bounces-76230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C568BC1ED2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B89F74F6D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435162E6122;
	Tue,  7 Oct 2025 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4f/MGlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18802DCF41
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850700; cv=none; b=tTHmM9KILHgU12FJN8SmYmmu+0BJFK8zqsB4DDw88+5E0iHlI9sNkIiVv2AK5Lq3S0pdTGp8eH2NjuyqByokwVs8bzsI6WXyu76IYVK8w8hsfx/PfqmApX/kVq627dOVg6sMcVdhwsuqD32+ML7HfgrEGjaCs6+9Qr492m7rJI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850700; c=relaxed/simple;
	bh=cO6ufnr7kktgdkufanFbscgObFJ7srpBGMMCASh1Xgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUuwuAD4mt3iekqPoGD5QNvQnnrwhnJ8gYMgG8856W+7Xa/HhwKxtJvm8zFxhGQims2QeZf1vGNQI6RwQL/EiAfjifSq9uluKSFicyDXekJsYq0BdUXmlVj52Xm0VM56J/R3n9syzBOcafTQ0O+y8h3Z43JjlYctbFLt3R7ynzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4f/MGlV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETBoN006689
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XcSSDSVb5D1JDm2vjIOTSOnm3O/zL8MK741maSSDVsc=; b=n4f/MGlV3i6pFs4F
	Yx1VCC3Ur/urkVYfX3GjW8yGZHgGAXtvZsNGa4O+SBFtcae7z1Arzt/pH2gZGHIt
	lhmrivLpzOrAQprqMXYOZ2Xk1SkYMRsn0s06BMzqQKsTl9eHixG9zVF9xQ44gSBp
	vHSUDDCmoeBm9iaB4Bg1SEdCDj9UKHC6F/f7ZcCyvqvAlZL5+Y/TMxSkWG5Ghq+L
	5khHEx8NFtN9L2Je0SRuKk4LD0PCE9+d6KbLbravLCVbWlljZ3pYckXntVBws3ql
	JrzqQFg8wCalx2d83qj6mDYtPgmsAtRW5SIuKaUGUj/XhwJwHn34B5DlH8Bd8bUU
	st2xMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1qmf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:24:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2698b5fbe5bso76064165ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759850697; x=1760455497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcSSDSVb5D1JDm2vjIOTSOnm3O/zL8MK741maSSDVsc=;
        b=fbYhDx6eQCj7yVOfMDpQR4msRKPpS8l78huaUS/ZSrqBEOjQ6NYgT2TbiUmtfHa11X
         c/6eb/rQBq5QVfjJKAJEscu1fisFkZppawW88Rg2PMyUTYyytMZSwTUJrQnZ8tZAcsw7
         0GR9R2EtfiXCJzYXT32sMdHtsIT06m6BbKs1A6kpyNcu2Lj/SVDnkb7qD9GdQu/rsSCV
         CR8vQXVP+VQrtapBcKIqUp8Jj/VYsyVX8YRgQ4pHDrfU1p256wxiBVEafGnVb18/ehcc
         +HC78Z3uiYoAzhcjdvqp7skLSx0OawN2rpdUX5Ey39y+bGhMjfJ4g1srWQtK0WbGTCNs
         5gBg==
X-Forwarded-Encrypted: i=1; AJvYcCW/7mPCNgC7YMvIy3jbm8jhAik7TBTo5SgBJHUBfZ7snAMwh5RuQxNrFa25reTcHeLpDk4Q2MbVOvluIRkm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn+IZbHHcPM24URfIjwJZ3v8ScQbruPCk+yE/0QIl4GulNEOdG
	hwctpMUdzS9CcQBJAJ01egVGo7la3mYPiv8pPJhqSTWvoQ1t1tBg0cftjSucDzjqIeaAj7+JMbF
	scwAA2QZZu0Tbv3ccNyXK5s0ZJ7tKts1cTT35BsiPYZ5XliQS9w3eOBReTYBsJOfjKKMW
X-Gm-Gg: ASbGncs6qw2ExxRoIKxlweBwzZ37ENA+sIEZx0HOOyzKK4MjzvbaWyozjbydY4PYYlU
	ISMvLjuOgJCnNa0Lh8xH1O7If2wngcHGq0obGYpm06h6uOKihu+E6jgQYLoFmVe5oeb/Km0aQLS
	TIY0i/y3FMk+P8FIiDsUIn3QdIyrwuV0K6tLWsJHX5W5RPViM5q/OmysBkOu/MTRX+B26sMOvVI
	zx2HQbLKEH1x16Y870RbHKeAmt/iNnKKDPDalytE+rZKX4OTg7drTsS1t9JKfAXCULDWFK5YOrg
	0Xhz2WpHbV7snpoVQlYSVh6L9thShYi8s9UOrFYe9dr64tKx04m9IIDvPlFhatJqrzVcfmZr2h+
	fq3iskvObBZ42mIRVUuM=
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id d9443c01a7336-290273032d9mr2018795ad.54.1759850696980;
        Tue, 07 Oct 2025 08:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpQdvk+bnK1od4ze3Y3yevCGcGPudiSAKRvYlPBUT2nEB/5pbIwu8CQRtOTQlJUw7+Chn6mQ==
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id d9443c01a7336-290273032d9mr2018435ad.54.1759850696571;
        Tue, 07 Oct 2025 08:24:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5e36sm169284865ad.114.2025.10.07.08.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:24:56 -0700 (PDT)
Message-ID: <e392ec32-b547-428c-bab3-d6ba0940d5d2@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:24:54 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Synchronize access to DBC request queue head
 & tail pointer
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y5o9CUXDw3nR8304EGjLAH6YqZOJYUUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX8Oo/jDbX6+zG
 xruvKd2MIkPFkkV3xNTvloWtT1rq9ny9w2o/wBVGA6pFMOAT/psPYpGMXwbiMx+4bbPaZobhCFq
 yzQksBQUmtHnTTlWA119+zA4VGa37rOauqe7GeSxKHOWBkrXlkvFu/Caza6jfNUXTjZe9RicbST
 O6v80bHnCB/mZ/UsurfRbB1jTUnqZkMrQd/JbyOUTB53ZS8pZRwcaplVNskLIOGWWkUaFjw0qt1
 mWUSOGMQuKdXwP1PfeW2tIPqwuNJ5lMVkc08MVIn4iT2f4+lokoiYUOZMWYw6euPHPE797SmoIV
 H2L3uuYw/HT1xqWDG4qXugj38CAuL5wnzN7pDxAFAFsfU/zu5FlCZSplJuh1uAjL8nfziRRFbR0
 cvteSbah39aRCNlXgiSZFhhJRPifyg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e530c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Oh1Qi44SMlBjVNmzfBIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Y5o9CUXDw3nR8304EGjLAH6YqZOJYUUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 10/7/2025 12:18 AM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Two threads of the same process can potential read and write parallelly to
> head and tail pointers of the same DBC request queue. This could lead to a
> race condition and corrupt the DBC request queue.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Looks like this is missing a fixes tag.  Can you just reply with the 
right tag? No need for a v2 just for that.

With that
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

