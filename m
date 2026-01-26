Return-Path: <linux-arm-msm+bounces-90587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAV9I4mUd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:21:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7C8A9BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1725303D702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3DA334C03;
	Mon, 26 Jan 2026 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqPBRpPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tu0Bdt9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4FC305E21
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444427; cv=none; b=qyI7ZZaLWE2WbIxXpiXoQGwWJOGuZOE+GUk+E4qnwqaofAQ/kQNqf6Bq3nVNgTDOIJeaCDjEVZ1EKGbOle+E2C/MQdq0+8aebXyC4n1v8QCBWFNlPqZslkDA5shjKHHQ0h5qGpkHz15CVXIPPsjbfk+hAtm6zr69kJHF5AKlr7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444427; c=relaxed/simple;
	bh=/smmK47PbQdFJDsC3KMabDwT9Chn1G7CNVgPaLL8ero=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNcV/dguDIvh9Fk4SW8IXVIv0Q58J1P/2DL1YhfeIJEfQIf8uGREfhM2661bIkaZ5YbXWDHsj57cqKYkfuIeN2jUdShQ3fXBoR7VbhxqwqOSD4NxDqP60kqO/1C/N4TzTw3ayDjXzTTpwBRW7Id7dKKTLaf4cf1js2YW4s/1PxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqPBRpPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tu0Bdt9E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q940MF384374
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 16:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9oU0cU0iS8ibF/AIo3DwOSofwYBcrbGsmjI9pc38KA=; b=UqPBRpPW8XGQt49x
	4nIs/1BBmM+U2ngGKmcePq9aSkKRk7VPXclXdEol5IVW+gvLlx7uXFBOHS8wyBTR
	QZ+2qCboj50YCXLxLzfxnlEGQO03jeO+x5cNC5FAIcPmdMcX5/kASXmXwL337y2h
	FxjsxU83dNqB9bskqKoBLHHrn85AwjhZlDzGCXRHCXaX58afrKwnY3GjUUZXfmN/
	uNBbukNw4AqOhU6wpyVE9PjXgJudtHmWPUnotKyu6yZGYxjMGUHMZMITdCQtdtJD
	Q6lwAxgCLfcIhZR88iM7qx578wcGtkW4SC8tzI7KYnEs0tMPLU1WL8U2s/8WFH3h
	9buUSg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tw2gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 16:20:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso8535657eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769444424; x=1770049224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9oU0cU0iS8ibF/AIo3DwOSofwYBcrbGsmjI9pc38KA=;
        b=Tu0Bdt9E6yKeT87v5arFoTDV9+E8bKKJIfsOf5FAIycu01MqXyvgtq/6LyweYkQTH9
         TO/ysLkdliNEslpSxbJN0G/RDyhVpq5A8baQEOfMlJWU644+Id597YFIHGWhENkXrjxv
         GU9GGEKbsMKjfc33I8cs+TwgUwWb01kXbYkog8MduhA3VX5RdlcEIODdIQoQn1sb+qfA
         fGIvCETeMXhGU6E/ymqgk8KTwAfbkVBS7OsV/I6Ugo85ZeJOqJWBMRApBD+Q5nknoOJP
         bL3pBCto7Kq/kAimllYnQdWgOTBcZKczGaUGRRU3x3crbpgxmd2ZVw97jBhxxbg+0/1M
         4Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444424; x=1770049224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9oU0cU0iS8ibF/AIo3DwOSofwYBcrbGsmjI9pc38KA=;
        b=SgGRDpZ5N5ChqYb2NDFpNvgDhAz2GoM5ANj3PNdHgW7LuRNc1Ksx+QgurdqRvcU81t
         y/lh+pn7+0/A5n+j9U+I4yorcaQRi01QIsXGF125boKvkGkxclqUiDkvDePckd+wj//2
         xRK6z+ENhTy5JM5FgExY5aFk5wu9i/jXVl08Ei4uEhj3tGKoXixUR9FP0pi+d1lWaI/N
         AlZPCmP+Vg3J/Hil6zxvYvYmBUiPke31oXje5JiEyZMqwUMXEuXr76DgU/vRyuaOoOBR
         5oGBpzUHfl2k34GWFuM5FQYxzImwZkpR9YVML+VWq7LsYydF+5OUOy56OWV4i7eca3c/
         FA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLswRvJ80fPwBOcb93/834X+uIF9bLpoPwvdZP5izDWgQ5chZjN8NovX61CRfZl0I9qmih36doocIkVm/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmo3wN4Xi3gYGmVnQ2PEas54HEzwa0pE3Sch/j0/2+YFyvQtot
	YiN7ZIWPiNYLtieYuR3FENRP/u1Unxbdrnx1cMrfTGd9gtsJXzWofdKsVH1mPC0VERr9/+3+6QL
	nWCPt8MOHPY20fPuPpMv84JUsfWtjfVG3T9pfDPhv5Dy5Nz9qofVhMtgDbXF5DgmSTVIQ
X-Gm-Gg: AZuq6aKXRcjKxPY6VIGEC+jBxWIOTf53S8QD6Vo83w5yROCFkJuh8H9pqhbx043xc98
	BapB2E5UE5gzAVIrIlBzhWpWD+uz8WVgoIzW4QPOZoDau1xNxsdOdmWkRjdRqiAY1WQ8h9hnQrX
	Qepnr+fivoE0j3UVRfqIbPq0Z2/z6eWW/1c1s8Gdv9mYXixMG81uCuUK8iiivq4EXINdWbg6b/x
	wcsaoNT3DnH+9KXbvIpRpPhJwml9zoksDQByknNw5cJzPvumniyX0kg3kN5xoyyckQM4Vu3WzJP
	Q/0XcAu1ZTX2iZbPaADIGn1XQZ3I9EqQzaaRn/fw8tL8qz3USX9RGiw8hq8r4jSLXqmJR/vLoyn
	abkklg0Owc+Sk1ShMt57e/352/w14MJqhB1FscO6LSIv4zeQpH7BQKe76RhbDuKc=
X-Received: by 2002:a05:7301:3d0a:b0:2ae:55f0:f2be with SMTP id 5a478bee46e88-2b764525c08mr2618044eec.31.1769444424174;
        Mon, 26 Jan 2026 08:20:24 -0800 (PST)
X-Received: by 2002:a05:7301:3d0a:b0:2ae:55f0:f2be with SMTP id 5a478bee46e88-2b764525c08mr2618024eec.31.1769444423478;
        Mon, 26 Jan 2026 08:20:23 -0800 (PST)
Received: from [10.110.37.82] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa08964sm13801267eec.28.2026.01.26.08.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 08:20:22 -0800 (PST)
Message-ID: <5b62b672-d6fe-42e1-bf31-15ec16ed7d3d@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:20:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] Bluetooth: hci_qca: Refactor HFP hardware offload
 capability handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
References: <20260123055243.2634107-1-mengshi.wu@oss.qualcomm.com>
 <20260123055243.2634107-2-mengshi.wu@oss.qualcomm.com>
 <mt4j2cxliqkwbeprt7ye2kt2cgi2bjfnz2knfgxvy7fy6wda3p@jadb7x7ocagi>
Content-Language: en-US
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <mt4j2cxliqkwbeprt7ye2kt2cgi2bjfnz2knfgxvy7fy6wda3p@jadb7x7ocagi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEzNiBTYWx0ZWRfX4n9Ldvdor5yz
 yxqcNhuLqzcdA8ZJSr+KNtVeTnlHKSLnJEJJFmZSgfcItSvEWXI2k5DI1p8B1VhTv+BcV5U7HYF
 OIpX2JGjP992wRyRZdLTZ6Pq+uddNPLjuPhwaatD8dTyuCGgLbC4NNXFfRs8qqhkue4bOpqJmJ3
 QbqtuflT+r3e+WM9hzZxLpzI8CuzFq3p7eufFkY4aKVZ+B6J212L7jzOQc+7mt1oRC/KsaJ3IKD
 aR7qLQxfbINlPY+nH3qo5QVbonViJEW/hNHGFR1k+E9wEPGL4idoXttZraf1Wk/rHW2atEuwniv
 Gbsa2yl6HKHdn38ncNqfzsowsyUbZnO9aTXYSWwrPVLyBC6nU4jPD9cLSZIpeawPmR1H5/EMV0K
 Pa47IKmk/jABuLRDKsZGypCbk6VeHJ9guCH8gdiQZ78+2plWtOmHna5q0fB6v5sYzRjKN90iL6n
 T4UOUUKslIEt1EV7/Pw==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=69779449 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lmeFXj1VSAwbam4jTmcA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: gZE4z4p1VLYWu3KZUZ58dcSlxOVKtLjZ
X-Proofpoint-ORIG-GUID: gZE4z4p1VLYWu3KZUZ58dcSlxOVKtLjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-90587-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5A7C8A9BA
X-Rspamd-Action: no action

Hi,

On 1/24/2026 3:26 AM, Dmitry Baryshkov wrote:
> On Fri, Jan 23, 2026 at 01:52:42PM +0800, Mengshi Wu wrote:
>> Replace SoC-specific check with capability-based approach for HFP
>> hardware offload configuration. Add QCA_CAP_HFP_HW_OFFLOAD capability
>> flag and support_hfp_hw_offload field to qca_serdev structure.
>>
>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> @@ -2033,7 +2034,7 @@ static int qca_setup(struct hci_uart *hu)
>>  	else
>>  		hu->hdev->set_bdaddr = qca_set_bdaddr;
>>  
>> -	if (soc_type == QCA_QCA2066)
>> +	if (qcadev->support_hfp_hw_offload)
> 
> At this point QCA2066 becomes broken until the next commit. This is not
> a proper way to do things. At the very least, squash the first chunk of
> your next commit into this patch.

Thanks for comments. I will fix this.

> 
>>  		qca_configure_hfp_offload(hdev);
>>  
>>  	qca->fw_version = le16_to_cpu(ver.patch_ver);
>> @@ -2502,6 +2503,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  
>>  		if (!(data->capabilities & QCA_CAP_VALID_LE_STATES))
>>  			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
>> +
>> +		if (data->capabilities & QCA_CAP_HFP_HW_OFFLOAD)
>> +			qcadev->support_hfp_hw_offload = true;
>>  	}
>>  
>>  	return 0;
>> -- 
>> 2.34.1
>>
> 

--
Best regards,
Mengshi Wu

