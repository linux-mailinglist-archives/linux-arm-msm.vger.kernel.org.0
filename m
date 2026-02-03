Return-Path: <linux-arm-msm+bounces-91723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNjcNltXgmmkSgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 21:15:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D4DE68C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 21:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2042C30A4515
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 20:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA9636AB5A;
	Tue,  3 Feb 2026 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S642t2iU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehXSC3CE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC57369983
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149693; cv=none; b=ghMeKbrZcwKuUt17h4a7AWUObGAVu/7Vet/v99d+orMy8ILxEZab9/hMSJCPJnHKPM8YDHZNf7IGKLgiRed8mtAsjGtamCuJHMTZsRa35fNOwXnhOPe/dPlHax2zoBUol2d1mZeLFAsu6yITVrqOf0xJygx0gEamZiqjn0edPxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149693; c=relaxed/simple;
	bh=g113ydTAZFm5Rr7Tgio7NJEkf9sT8TK/EhTbZO2mXmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDYbCI7VHMgujPROBiRJPjljAH3JG497pyeb4sN+Vm6cKtetA1IU8Nw3Q063I7kisI7PmqIYmmDX1yD3AyN3VszI6WVxcW8x5nOyH2wPapF3cEK59AeEqs0O8xHFxknEZFaet1UQ6BIn/tdBZyWEU17D08X/Hb74kjEhrXWD9NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S642t2iU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehXSC3CE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlpHx2613695
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 20:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=; b=S642t2iUR5AEQuUl
	A9Wmq7DQIIixJkvaZOFqUe5Q9d1+7m2lb5eH8yJDOl4mLigYGuBRzP6zkhC8XqRY
	QmrvzlnTKGfqi/KBx4xhIfZKVp++naan53+qMz1CvdqSxc/Ew0FzePd0i98vASuu
	YqIF2U+JUmFGq0o9jz2v+Glr1tbC1Q5maGsi7J6ae1DqBLLIoiMVHJWg9dVq4yAZ
	rQUyQ556ofF8ridKdQwWLmYMUy1N+0dLUGhbSVeArisfoQcI3eTiSO8uBtDKt15P
	wes0p97ppVDPknIyLP0fBWBdwiPwdT70xhglEbDRE66F3FMMtsnjnQkWPbHrIRJx
	qz7TNg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07hk7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 20:14:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f29ae883bso143395ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770149690; x=1770754490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=;
        b=ehXSC3CEPu9QH8FUtIN+Q9HsyqyE67VYR6Zv86R9zrgWoneGWal90U2tkHMSnO0lbo
         8mY7Y6KpINKZMwosT8xxmJNWTn4mB1DmeKZumaxcu/OS4tgEerkXXgd0zlq2rxEfbCgJ
         6mLgAXXdFW54HYd4Xn46dQeYZVQEzT2HAyukX58GSw3slH+9KhL/v6tT+ym/y1G+U/dn
         YB4ID8ti/rX2fuIZqVcJibD5OWFwxqz49LR3/06o+HhixZZ+4uvfZU34VSH1O6aJYqpx
         2Zmw6MhXxF9pPDexSp6hYWeL52H06kxgJZU2atAo1W+8YeyDpMAJ+LsAtJxIoAAKvUnA
         YPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149690; x=1770754490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=;
        b=cm3AU7GmvDa+Yzh0jCwnUd4vPOME4TW2qKronroa6cJFWg2rBV4Et84HGseUze8LdZ
         QDFzpJGsSP1g2tdLCYUmSRV1OMchRkKQRKbXfKlqew0Dswxu3BO0bpoTrprhSnjax71m
         0mvL5emfWutzHRXVWiLGnCE/NcR4SoSpXogccdCjP85Cca2HU0FH6IPBqsOQeso728P8
         gUmMZYaJfscDB2GQMrKFRwvaDRtTEo1AcE/pbBM8iRFUqmw62eA7R/NC2PcwCqaHOmjm
         +QVVCc1jfkHAWkzo6Ol6MVJp841nSjTLkoldLD747fHzCPZjHc1xdYWS9f7TUfK09MPc
         sOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWk0Kkfwzwcmn5Xb8fb/g8vdWTvnSta6k1xkMKSIN0m6/Qzt/MooQmsaey7jXh9EnZcofsfLabds81ZQED@vger.kernel.org
X-Gm-Message-State: AOJu0YyRl8EAqbRMhS4Lay/W2aRgitea/RKPbT3BoyPHYoHnlylQ8x0S
	vInJMqsMz7CRoddmaalMvsVCQwbk/7ulvfdDm8MWB8LSQEtELVxWNxjU7J8AvOhsevqLDzinrCN
	f2hUzY0zbxTsAQDKJqQjNXXe67t5sOIhhtbGQc7iSyUYaPnxIweM2YpNR2OfRu6/TMaVx
X-Gm-Gg: AZuq6aK9cOCMT+8WnGWiOrl2eHk1AFS8GB6aVVOgtvdBMKW2w8TsCJ8oSF717jtriEI
	mXvtnwiwltiNEz870wXIOyq7LiYLQRMztezRHTUO7dDXpNy9yFpuamZKpjDqsY1iCHA2fXEFIxL
	m3DfYAhve5vOsP1wjbgpTEFl7LIo4M0xHcXIy4nTdTU4WbI8tU6oht0X16rMkfdFOtmoIaLRftP
	Ez7WmtXd8kOgTJVl9VyAs8b6Yl6HOjMV9rxx7mmF1zlsOVsuF1NdFWFggTVWdu01cDOftQ4YIW9
	det64xpwkS46o5DiyrcE9emPgWe8AbdSSre2dQEtGnVkHvvra4Zjn99KDMvP5ctFqDZzpE8/tft
	sv5xGodgbTOavpks0pvUbxRa5Py+GS34mNg==
X-Received: by 2002:a17:90b:3b89:b0:352:e3d1:8d69 with SMTP id 98e67ed59e1d1-354870b1bb5mr334102a91.1.1770149689823;
        Tue, 03 Feb 2026 12:14:49 -0800 (PST)
X-Received: by 2002:a17:90b:3b89:b0:352:e3d1:8d69 with SMTP id 98e67ed59e1d1-354870b1bb5mr334077a91.1.1770149689371;
        Tue, 03 Feb 2026 12:14:49 -0800 (PST)
Received: from [192.168.1.11] ([106.222.231.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487131849sm97904a91.0.2026.02.03.12.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 12:14:48 -0800 (PST)
Message-ID: <86cc659d-f5d9-47b0-8134-6a4b11c99434@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 01:44:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm/gmu: Add SDM670
 compatible
To: Richard Acayan <mailingradian@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20240806214452.16406-7-mailingradian@gmail.com>
 <20240806214452.16406-8-mailingradian@gmail.com> <aYFJcxOXWpuuC41I@rdacayan>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <aYFJcxOXWpuuC41I@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2MCBTYWx0ZWRfX8vbn2ULCtvyS
 Ex0DzCNDLFjwroWQx8ByIG2X7YEPZVlm84O+mv2czbxP9gnEHUS908+LV/UklCDoKfdSqo6y1mZ
 OpmJGv7hm6fQIlB+Pbjx5eanUEOmwV/xylC64LLY/SG1Hlm8B5KzyD2cuQemQey4ymFO7LSJijZ
 UU3TwsJdioJZMy+wlBn1Leg61ypbWt0Tj+tNTt/zjt3iz0m4Rj30Ml489FMiW48d7ZdkqKSO7fO
 tlT1MvNqoytkw+WmoLPAlo9ByPyfafCYVvOMJHxZCC9MCvTy2P78fr3Isx8w179iYgKfqOV+Ox7
 iL8jA+UiSensM23qtjKpFdxUPpwG+5F+6ZR/uOE5slS3ZQE4s+/z1PieVhgPHsm21efISYpDm4a
 YTidrmQNEkwB+ARuY/n+ncSz9gPQmDYS5vUyjj16EvBA7rcrz4i2/udxrmG9+OlGoCpfi0X7DKH
 8HUs1JPs/h1qJBFxDYA==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6982573a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=TQVzCM6xFy0bRFPZzaP6Sw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=lqJ36Ib93Mf7KDR35b0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xzVsiMRkHs2327YIj1rBZs-91zjSuGxI
X-Proofpoint-GUID: xzVsiMRkHs2327YIj1rBZs-91zjSuGxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030160
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,quicinc.com,linaro.org,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B3D4DE68C
X-Rspamd-Action: no action

On 2/3/2026 6:33 AM, Richard Acayan wrote:
> On Tue, Aug 06, 2024 at 05:44:55PM -0400, Richard Acayan wrote:
>> The Snapdragon 670 has a GMU. Add its compatible.
>>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Ping, the contents of this patch seem worth including in the bindings
> but I haven't gotten a response to this patch.

This requires a rebase, most likely. Send a new rev?

-Akhil.

