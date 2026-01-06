Return-Path: <linux-arm-msm+bounces-87601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37932CF6746
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FE0F30A73C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2476246797;
	Tue,  6 Jan 2026 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gosSQmKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3IoUnIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823A23B61E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665772; cv=none; b=CGHsV6vbMT+7x7Gx9kXHd3CgTwZdb2vho08UEO5zPv3mz2aebbm25btdEodiK98yCNs87COKDp2yG2P30SwjjdPKBC0wk6g+q7UuRr7G/4bbaxSYJ99rmjWKgMoNrw1C8pySO6DyKRAiE+fzXw3ZZykYvnH+gTNoVlSsSCf7OUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665772; c=relaxed/simple;
	bh=TUHF9ztNEs/7czt1Jxow6KX0t+XWIyloinz7D4p9z4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eggEknRTwsgFA1zCZv9BTvAl9XOYiMjo7Y2lyrEH6nLIvpGKVfqGE5KkJFrWUJIHRQIXLibBcDJmHoMVy7sk47bOXCe0d9P6buh/VKmLFeVOqQUaE6Rgx+dQngtP6RcPLs4+vg/2f+B3REcSmeeIW80gle54g6YkbwbunE8nxJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gosSQmKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3IoUnIV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nEcI202377
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9iomrFfmYg/6HA3LVSllQen
	Xn+0Kal4uTrkXIWdGSg=; b=gosSQmKyGNgZbeFNXMqaoGUcauR8ahd8Ce3YAHGs
	v3fin0wz0XZ24NFFo7gPsIqQJ0NjVPZkjSHgT7O9XHmddWBeeG3dtWxMoCKFc5zK
	oi2BN1ACia9yfufO5BagWU//8/vn/9TyXxiM6PdQYP7ciIZKTnQnXumOsxQnry/1
	nVy13f0LfnTBkwelFZvRnmjSGVsINzD0vxGosYSR7iJZ+QhsblLO2sbQqUe/occ/
	+r9h1g7Ns4gozywXKUyZB2SEOyQhIvLvMyoq5OFQTthF+Mr5Gk6bbMQw/g5LVaRr
	69bbAkNlI8YQVyVYpl5HCoVYhA/k6ZsQzeBI4k6CYtzscA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu1euh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:16:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a5dba954so14178611cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767665769; x=1768270569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9iomrFfmYg/6HA3LVSllQenXn+0Kal4uTrkXIWdGSg=;
        b=J3IoUnIVo5nHcAGFTajmc2tcqqtIEmdAqbvzRRIXu2R1tbddyPCoIQW3JsnRQuRoxC
         zLIux3t+KVwKBkAA9EdKBDyhobb6X2EbDWTlrx4WDq+BttKPNuhG254d74f4uA7dbBfz
         6CehH1EA2Etz38qL5dqSD4SIHzkek3xxMnC1jNnGbIGkCRiou+lYMG3NuGtJ8WlM9Jmg
         BBiDlcKxZYY3XVmyvNULe/PFLJ1GjXzKr1WGDvtci69iOD3N8xiu3RH72f5VIatUky3B
         ZtcZXb+lqz4MpVURzBIoxvvV2U50HGYSEgii1NKaqhYA3AYuvqFrtadquHEoiDy7d3SL
         gbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767665769; x=1768270569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9iomrFfmYg/6HA3LVSllQenXn+0Kal4uTrkXIWdGSg=;
        b=iSkerfiWdMzGe0Yb3VQcssWQJHJ5mQpSxC/YOq6Hd2dBx1I9i/GmwvRn3aZ1NESH/n
         wjUHN4vDdC/y+f3UvC+Mdd3E3Rg5z4IkoYu/mGHk0lo0/T5rycT7DKQT8flbtIc479BI
         h8xVPS1OZHfTU0Eknora8+AxkodU4BhmGaJqB2U9cKwlxrlNXszOpX7W7u1BIzxCoX0q
         ANuOvQLwgMQm4v3ghjzC0lqOVn4mv3kfRsZpw/5EXCEFsEbevOAfGwr60PXR4JxmmMuA
         iY9vbq14n6rqWykBX0yhwVPQGF29h0q5q7EsQsdciwbQjjs2kk6RK3n/0ktDsoaP5/3Q
         Lp/A==
X-Forwarded-Encrypted: i=1; AJvYcCUUo0EFpI+h/l6kpJcYp3ONaJcI33kWSaXzQyE5uwO60QmFc4b0PKTAenrA0WAknoEV7bPfN+N1ysydh010@vger.kernel.org
X-Gm-Message-State: AOJu0YylGOhIuVNv7Kyiwl/MPNU9DgB+GFgugjDz1qYt7UfgG0hhoFYq
	qTkZmYy9iIK/2lqx+SUcqq0hGFhchfRRsRWqofegU+l1zQBN8caHSWmnehJGKNJ7odsS01DdlqZ
	7Rfk+seuEs6FFGx1YHnvngxwpdRis2fMgHN1WFSdF74pGpchY36u7sQATfMC+JY2qxX2T
X-Gm-Gg: AY/fxX6ipKnvaJVsbTvqyHPPVqfRD599bKGTuo5wQd64Xpx8v1G1n/VWt/gyRHzzIKq
	Uq2Uy4eeW0PEpLJ0VaJ8Q6FnHuVmXzZQW+WdbxI4HMgyyt8+Z0SMd6aZ5x5MI37VfT03+0I29og
	Du+8Xts+IGLz6bF0g5jSJ9MWUbqNeCn9qURbi0CBKHh7hiOtc1NIbP/T0m8/MHkb/H55Q9ezdfQ
	DKYoazvQFuSF9A/t7N3KAebIIrUXulUvYeNZ9IROMV+l+B61ajf5/031ZmF28l+4ZMECYkSiI+5
	cs4ECOSmiHbAplXoB1gnuA9xw++vpaMd/60zqe0cwg+UNwNFNnRwdajbe4voFBfdzex0gDcNAFy
	s5ZntfqocpCbm+nFgcmL9P1q67fQl4difzQc4T0cN+/3UDT2tbxxJWJblZj9QqLVsGoF18JAX8P
	IzCxLx+x++sF5nXEuRYXNtoXA=
X-Received: by 2002:ac8:5d49:0:b0:4ed:b134:38ea with SMTP id d75a77b69052e-4ffa77c0ceemr20486351cf.41.1767665769401;
        Mon, 05 Jan 2026 18:16:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/6jccP836wcg2kfbfEdXzrlFGXB5m6tGWTv+uag8uHyDAZOcFC3gNYkrsdpmeEcB1fyxZQA==
X-Received: by 2002:ac8:5d49:0:b0:4ed:b134:38ea with SMTP id d75a77b69052e-4ffa77c0ceemr20486031cf.41.1767665768880;
        Mon, 05 Jan 2026 18:16:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d1a153sm211351e87.44.2026.01.05.18.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:16:08 -0800 (PST)
Date: Tue, 6 Jan 2026 04:16:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v7 0/1] Bluetooth: btqca: move WCN7850 WA
Message-ID: <tfdeucc7opjtjuo723hskens3te3eg5ohm7db6tbhompbtgkkq@vsqgz5qtmbr2>
References: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxOCBTYWx0ZWRfX1TsYPJvC+T4n
 MkYksDhNvsreuNWseifmEEj5JCGslmimcWlFAq102HuH95KJqYVIBWYv+S849OhwrsZyB8cNcOl
 pACDzhfY3RwECcM3MUhbF3c1FsMutjDxhbS7Nx/ymq3nzDE6iYZFbEMBovaYcAsQtUvbxitCeOY
 tn0PPqfIXzZRIzo99vAQ2mipJKdpeHteKJ5w2O0KAPitofBrE1ONlRE9t9k/3uodVsEymnQRC+b
 Op9n/DkVRG/v5kIU/JeOEcKVioiNruu5gchL/SU9DA2ALCUgqmTAUhBdVHWGIKrR8yZ4bZ8nx03
 PGHy2Urmwkqd0pxwKuR9YP9RVYDMU/put4pgkifxaSwtaMGyLgTaL3ohr4cPIONsZKkWw6MQzbI
 /ERSsNdfST78LkLgUv+jCBWzwy2051H4lcUTcVuwNLneiop3jG9Z/JZNxMI4UUR7GnhB+i6jT9I
 48QcJ089GUW2BSYIvYQ==
X-Proofpoint-ORIG-GUID: mvgaSXit3oBt0y-e8jVV4OSMlemCRbZ6
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695c706a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=GL40hWPH6WxBScVHmQYA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mvgaSXit3oBt0y-e8jVV4OSMlemCRbZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060018

On Tue, Jan 06, 2026 at 10:07:37AM +0800, Shuai Zhang wrote:
> Move WCN7850 workaround to the caller

Why have you lost the second patch?

> 
> Changes v7
> - Update the if logic for firmware retrieval failure.
> - Link to v6:
>   https://lore.kernel.org/all/20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com/
> Changes v6
> - Add WCN7850 workaround details in the commit.
> - Reduce the logic nesting level.
> - Link to v5:
>   https://lore.kernel.org/all/20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com/
> 
> Changes v5
> - Separate move WCN7850 and add WCN6855 fw name commit.
> - remove WCN7850 unuseless condition.
> - Link to v4:
>   https://lore.kernel.org/all/20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com/
> 
> Changed v4:
> - move WCN7850 WA to the caller.
>   handle cases where the firmware cannot be found.
> - Link to v3
>   https://lore.kernel.org/all/20251117021645.712753-1-shuai.zhang@oss.qualcomm.com/
> 
> changed v3:
> - Remove CC satble
> - Update commit
> - add test steps and log
> - Link to v2
>   https://lore.kernel.org/all/20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com/
> 
> Changes v2:
> - Add Fixes tag.
> - Add comments in the commit and code to explain the reason for the changes.
> - Link to v1
>   https://lore.kernel.org/all/20251112074638.1592864-1-quic_shuaz@quicinc.com/
> 
> Shuai Zhang (2):
>   Bluetooth: btqca: move WCN7850 workaround to the caller
>   Bluetooth: btqca: Add WCN6855 firmware priority selection feature
> 
>  drivers/bluetooth/btqca.c | 66 ++++++++++++++++++++++++---------------
>  1 file changed, 41 insertions(+), 25 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

