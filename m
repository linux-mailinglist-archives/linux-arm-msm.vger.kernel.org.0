Return-Path: <linux-arm-msm+bounces-54042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D88A86224
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 17:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A27074A0251
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8984B126C13;
	Fri, 11 Apr 2025 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUkBpeWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092672AD14
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386172; cv=none; b=pEEo1ln/jBeeBs/kKI8aIP4sZaNuwJu+zMQXCN+YMPZtUpo6pdKXbdfiHMzUXWoI8bfJbT+kl6goBd1qOKN9CnTNsHJfSl+eRoyiDCZv2aROMiZLojEsLJtr5MzooNQ3snmboOlawka80uTLB55DZbT61QaEwe2ytkNfVGT4f7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386172; c=relaxed/simple;
	bh=6nPgQpH5zcIav/QWvGWHN3rwEeTcxyeBjvgA8/YjGh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHdhPUmc6xXMBHGVgYOPAVGUrWUpOGCCVxQJWOv21oR/eflEaarVfDrSmClfiodkRyExIhnsySpv3/k+oeiFhTu+3ksGpogTZyPgR0hxQee7mSOXkPPLp2Doqbh+FO1lAGGyKXOhbn9nLU7HwsiTb9NCKlOkZ2EzgyNU1NFcUQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUkBpeWo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFSae6018803
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 15:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+G6S6fjYAcXLJvVxUHf1XHcvPAFX78OEzJRwUIIELqg=; b=PUkBpeWo7BvgPhjU
	v69V+AnA4PcnHP9PecksV4VDqI3QboKOwSdj1ONlEE9LcKM5ICXULiHVq7I6fMcu
	WX10gbnKQ2MHJJVVriOYU0yCveqVI1+n1LDdnQKgPfRtjp+vgg9jCtf9aU6/mE3M
	9BS3dd0ktqI1SDOIUgH/07OhS7wzcmMvHOCVAgBPPxmil5xHAmimTkSToihJvkC9
	aqsDoRmXo1UoB65QCCPAj1T25KMlHj6CkZEJqz65GRhlF8iWl+QGpBXIM3xFPSZ5
	BtHZTkJ36vcbXWiHu4pORbF8ZExVSm4ew0zid751QZLWlaJ27UeSSFI2zTK4snHi
	dkjHfg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgu1cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 15:42:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b00e4358a34so1384110a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386168; x=1744990968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+G6S6fjYAcXLJvVxUHf1XHcvPAFX78OEzJRwUIIELqg=;
        b=ZuTQlCxihOU9N0DjRu0BrRPyF/JJgh299KMDqC/aT/SSzAXhEh6pjofraIYHhPkizJ
         ajJYsd5V0q5WEU0+k6f99oRKTHI8TH+BW8BQyn7avVknA6+Th18q277wMds6PD7XyvYv
         EVrg+EjAhvHhXkjTllx0SeaROPwAs0k60tuCkns706Jao+LagOWJdFSX3jXGpt6S4XI6
         AiXn0zB9PYPCl9j1Fmwpk13vKM6jURSxkJEgoW/ihc0Ksz17Q5gmichiJwUcP0seer5F
         LLxwPMZBErZ02NxwOMffIyQQ6eGpugKy4VXs/ncaxKbxj8FlwOYCa115COWjjXTRZgw6
         POBQ==
X-Gm-Message-State: AOJu0YwiRzu6Q59Udt75a3X/rm9iOYG/mnIsvaEzIXEvFQxPkyFEA4JZ
	pV8b4nehbt3mKeYFh2p0SA4J/D+kvWXxlQVEIGANVRlHWj6/3JzvlNKVC1+UXtd5PbhPYREsrPr
	Z8UxrBhF2pHu/T+lN+8+QIeKaF0PniZU79hFYxUoXo1MT5g9ysCae0HSngQPcu/sn
X-Gm-Gg: ASbGncsXAeqQYmxGaJnj2srtFtHf5EyQvofiJB3iXCzvrBlj8313a9fkErvFsxAEDj4
	wV39htpDmFDf7MK6k5pmZ+6iqx6gYl8OJ8RO67Kz9BXWEYNed9tBi2DU2jw55C2Uxh4xdx+9Mi6
	6tOY6Amk/X7cHnzZF38pBTYM88KNFpaNvW7d1nwU0zn9Ov0s5eXfMjFa/TgZxXHAiLpOvJ+Ms8g
	nkXpCt6FsVJa0XaMZZi6DISMFMMVGDQTAF87xmc0m5Ju7iOI6YzUZOEwxrWyN676LZU0VjIq5ee
	zSBWNZGOQSKgEC8Sm6KvP/TZtH5Pn+r209DpkU95hJeC4lN3JMOx4DUoiAGqCw==
X-Received: by 2002:a17:903:240b:b0:220:d601:a704 with SMTP id d9443c01a7336-22bea4ab69emr46195295ad.18.1744386168417;
        Fri, 11 Apr 2025 08:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS6DIuCGq+n7D73U/Fkn8oMG3w3zcYaPL0gpjJqD5D2dhmd558+r2q83LYGhuNF9aG8mtrfg==
X-Received: by 2002:a17:903:240b:b0:220:d601:a704 with SMTP id d9443c01a7336-22bea4ab69emr46194945ad.18.1744386168027;
        Fri, 11 Apr 2025 08:42:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c993b2sm50738955ad.135.2025.04.11.08.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 08:42:47 -0700 (PDT)
Message-ID: <32676fb5-ccab-403b-b426-9c05502bbd1a@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:42:46 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, quic_carlv@quicinc.com,
        ogabbay@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f93879 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=HMLxokm-dE5sQ3OGyH8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Um47Svsc3CHGCgF6o8uHNmj8UNGa_ZJn
X-Proofpoint-GUID: Um47Svsc3CHGCgF6o8uHNmj8UNGa_ZJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=825 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110100

On 4/8/2025 5:52 AM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied to drm-misc-next

