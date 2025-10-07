Return-Path: <linux-arm-msm+bounces-76229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11196BC1E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 58DE34F447E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2379186329;
	Tue,  7 Oct 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPHUri4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846162E3B06
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850463; cv=none; b=akqnyGSgfu1cKDcjURHpAzAdbN5PS3azBCTueQeswWyCpqdVSswoHFnQBjvRXmBHie06yzS2EqjRlneuC/pvq/c6otQVuC0PihyhkjVfR8ER3CqMpZ4D97WWqWzTnj0LNBmo3fJ7CKKC9hUzKFGSLR3KXL1yxrk9LqtvhcNfA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850463; c=relaxed/simple;
	bh=jJCTSzIjXOmsZLd5AZISe5j83w83puH+l4VxmvV5TjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lT53R72OQua+z7qnr8o/d09EwCBLjsDN03px4ZYqQfPRc8Por/UqCsZNgVxtIlyQ8Fudv97PoHIBltU+PHcya6PktE6n2a6tHQG61KK6QSMQi+nQpSiMO9TOmtURUv61CEw6n2yCDmyWYbRCzckrXcMbdeq2rFdnGcXs1QUfBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPHUri4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Ek3ai011184
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iWmS6lQW7nrNfAJ3oL/Wk5t1P1Ffsn1nlDPeOvhMDs=; b=oPHUri4kXtf7+GBY
	mXmBNWcOFME67KOtWsMTCxZnjQAO2qYBph8+cwyFMRhUwPVjN+kbClxXGM/cZqkf
	Z7xeIRmvF5kHxt2dePovX6Niv7T3gNIa6GXMKone81AdaNxzwo2Q11yqVy3Dafc8
	w5OECZhZhy/HsqdFfjcHxYcHENb8aQSug5Tu0EdxefN3egQAwxUEWNj+pUK9QSh+
	9SBjI4Gt/yfZnNolL/u0F8QuQGN2zpIRtyZjRbBhQg1cA5pxhZXD5MvQuNnHM1eu
	0ysFJOalm/lSEkDQlGKB85jbzCGbFXRjQ/5PoAJ7qqXAHrPUtjVx/5jUGDi6Hwha
	rO5eNA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wkr41k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:21:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1903156a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759850460; x=1760455260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0iWmS6lQW7nrNfAJ3oL/Wk5t1P1Ffsn1nlDPeOvhMDs=;
        b=gUH9DzFou9yoY6SbrC/Bbaq/gR94iDq+kwOl5cTyTL8shV3IdWcBZPDQxq68t8fDs4
         XVE1f/1zxS6BWdNaU125OogCGuC2ST713wiUDmxEjQHqn1XRDUwdNqx67K/gLdZKqIE5
         BooiAW3QRXncxPt/15kaLxvQURxsvRqbzR7IGcv5rCYbrApfM9mx84kaHUmnH7hG2uaf
         l4DVvm/ls4j7v8p9K3w2OmihMqH2b+BTcTSIDu0ZpAhUvHBK7XOxJUD3ldrvUzaSFhPt
         NrGxJ8GmabknsBwHTj30pXCxIDdQiZ04FhEGxzbWHAeTDKX+RGvTOjCUUScZYU03YaKL
         B7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXywX2asUC/KJZwVwRiQdXDkEgqGjViUrmjp5SG6onRikDqDjJzUMkO2JuyYznvptKTLaOUUu/eklVbzZtC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Je79xURvhog5/0TxGc2fyLS1ycxeHmkGvrNhU82nGHJdQVrU
	2vbf+UaL55kZ1X5hj05ASm1cbs9m8QZh0PdREs9HbfIQScGY/fO24imeub5R8ZBvZ4SiClaj7fs
	1p4vh2nhPbMYhnOgoPhkwXkBUcq+/DYwFMTUPgavfIVYmJt1oCtwbKFXjR5MWSmr2BSsb
X-Gm-Gg: ASbGnctXQLmIPONh8pF8neABGBT5+kN4gBfJ/LgD/590ced+9iT+78nrA3MZbpM9ynY
	tgj3oD2qoCFDAwZteXpqnEA8X7C0YOqaKW0o7aXUggbgymNO3FEPgCnZT5ucfYrYgZAZtAQi3uT
	7Yn/en8iEzqN9UDKMuFO8K2vhYDzHp9oAOJbvVwiv30GSjWe3MEEXhix5VWFlHvtayT14SNKhFO
	lL3jaGJT+6qDou/X3ZO2VLBQGuHGSY7z7O44gJpi+23mxliNnbnGhdn/R0S8E602vEaKKS0k6/U
	tT8VHqY1LTNrblpnnxYVOYxEmTUYT1PYm1nUsy2wl/kHFTQeOZId03SEoPPRRNH7B7TZWpvCZtW
	ORYkabmNb533VINbZpaw=
X-Received: by 2002:a17:903:388c:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-290272161edmr2236905ad.5.1759850459406;
        Tue, 07 Oct 2025 08:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvtqCZgIqPAZF1VGaqwpoCFs09dOwY6K4MD8ALYKP9O+yrxMmdbHcIeQr/kqofot5UmriisA==
X-Received: by 2002:a17:903:388c:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-290272161edmr2236485ad.5.1759850458968;
        Tue, 07 Oct 2025 08:20:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d112797sm167816485ad.22.2025.10.07.08.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:20:58 -0700 (PDT)
Message-ID: <28aafc68-4dcf-4a55-9762-c2c3e1ddfe98@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:20:57 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add support to export dmabuf fd
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX7EhPOSpkbw1r
 q2MUeuhp3l+SFafO33Vi8QR0aWXDPbJ0Fy9rlzsEaQUPyLVf16LvcpZxf9MTsVHKBaAEjD7/N/T
 kA9v1ECuJvkzWQ34QNOV4MSQz5oolZZH6EjI+FnSf/glub3hTG1397VILnoNc3+zWtzUW/By01P
 u9yZLSg0v8AWrVnXrMkT7Uru41yTTO+uTzZBvlOlg5YRn//dMLD2oEdKijAtB7oNCqKf/rs6Az/
 c9IUMVolxvLbqsnMiGLFvaPvUIPveS9QoTNb2vs/Slzaqqh1OBYynK2MMJlcOj/8zq7gbgz8Cg3
 rW5TB8Aa6rM503G9IozsqxGO3JKLbUJmSyaqcPFFsum+7ohnsTU207FeM05kFgYD2o6ZsvXdwbV
 vEObmsq/elcyo/bRGhu2MFyf7LkqMA==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e52fdc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qTQW5CXGkwUWSGTXi8sA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oDmyByDxsjcwM8zhF2jmoJb7mN6i1Xwf
X-Proofpoint-ORIG-GUID: oDmyByDxsjcwM8zhF2jmoJb7mN6i1Xwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

On 10/6/2025 11:38 PM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Add support to export BO as DMABUF to enable userspace to reuse buffers
> and reduce number of copy.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

