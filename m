Return-Path: <linux-arm-msm+bounces-81279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F81C4E343
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29A01897682
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB45A34250B;
	Tue, 11 Nov 2025 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzk210YO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3oGcWS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434D340281
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868409; cv=none; b=mYTXzsK9rrFF5hOY3K70tvNc+XDqDzhGPVkzBJ98yRo0BKyv6BgwWNIBmj/jEas9xRydVgnrw6T/hnD1Scqr/pU+Ei+WjWaW9CU04YNTggc8iw61Jeo4VP7dsihqU/tAoxPCG6BeQUIXe6Xt+fQmjsmuJ/yWN50Mks8fewdk1Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868409; c=relaxed/simple;
	bh=s2AjnkkPP2KRJHp+NjW1PV3jCSHP+i1I/AkGCZAB5+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSp+Z19fCni0Xc0wSjcP3ENxjTblyt6M0yvgYol9+8EL0e7qldXfQ2eGyJF0F5zTqfUQVHPNI/mWUil6Ywos4djXLjpdQHX9N4XPsnaeGZR7pJVc0yxISQlZlmKW89HdMRIhGIfBRwdEUfg+4loULOsW0nLRdAEAEmmVEjlL9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzk210YO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3oGcWS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBG86M2425254
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m/9OP2fjJmx3ZLFyrTIOYLQZ
	UJpxWFVVOvLJMaZcRx4=; b=kzk210YOKcVVi9iPIY1l2uifnvu4ZI3+R485EIuL
	bJgyV/L/R7oK6k+Y02rhWa0tdG6EPQ6ePFLUXpmasZ4137y2dLBzqGaFZsxPVshG
	Q4LKtjVSuoRKx0UJNU8mjO3jRZP++LfB7TKMf4vxnnW+7gscLWpiK4oNd2BwPzkm
	LMr3CcOOffrLtco5jz66kDU9lVO/yYjz3SSxYDp+WKHoL115xfkHWotVWcwimMNc
	d3pogRbdiP9N3l910mIqdZF3sb4StNESK+zvBkqOQQnoySGBc668rwl93qg4/fuH
	JdfGbAuhNHd1Mj4+ESoPlT+QYg6UcxcqyzXgxNAHd17p8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350rva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 13:40:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso3065964a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762868404; x=1763473204; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/9OP2fjJmx3ZLFyrTIOYLQZUJpxWFVVOvLJMaZcRx4=;
        b=Y3oGcWS2ifHMBskd3Ad8EKA1+gJtVyuE5EXDuJ4eizV/gR8SxgJrP10pCUNGCjiGQi
         hB3Oa6DA+zahjp3KX/SXvAvlz5Mj6jC5UYNGgPf+stvMqPqUkUkT0v9CIvu+WcmJV2BK
         p1lb4BcPmK+qEiU9RovYllY0Tp+L9Ut8e8vWcbUzKWxLPy272D6emcXQO3Ob0BKFWYYU
         CY9ziZrVSfi8X97ZSk+zpnUD88JSR/ZuWlcUqzrp7NWaOaoLTEMOOvVHJg2NK4CxS9FP
         De1GXI8yvQOroyNGRizr9ilnN2YiOjePyN8CQfjwtRXr0MdCacTZYAdK20NPhREVPyJ5
         N9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762868404; x=1763473204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/9OP2fjJmx3ZLFyrTIOYLQZUJpxWFVVOvLJMaZcRx4=;
        b=Y9exfmJZO/7aKE6ISDCcotGE4uypIZeALzmg1ON/j14IkGtCXuY19QsrSPs/vCxmRF
         WZo0xQnIGVygZlA6GrH9k46BYYjoDVxpQy/wO1C7NAgCfhty2TFdJK+7e5xCePb+JiSY
         HgQ7MRMjj2d7WSokvCZCAAtH5MVyw5xng2F7HBTHlr/Vk+ov9LMTgz1xXQy0HI3OTDAg
         izuUpNIGMpuDf2Q0YTviRD/LC6BJkkzxgcI08jHXy//Ft13Bkek/vroGaroMbijVA/q8
         RNWyW42JiPXAFNAHA6B5pXDu1JxBzg9kji803rTAs4LpeeBL0TnS79oxslNftMdUQK/A
         lQxg==
X-Forwarded-Encrypted: i=1; AJvYcCUTYCdOg07TDgXpCWc8uUfbWRDQbZPnCMveuNQyiFh0Yz/pOk/odHzALtb+YALrqmgRCrmPcIRdf8qmkGKp@vger.kernel.org
X-Gm-Message-State: AOJu0YzIp+KAChBk+8Quw59XPlW7fgWcmgJ+Qhu3upBPPvrRdSmWaNZe
	EDOt34gDEOJHJwrJGK6sJlh/N/YaB3p9vJmuqfZT/QDaPM+Oc/BOJYPdQ8MkzJwET4ihpRXJEp+
	mn+w+Jac72dV9rVFWvIUFsP5C7hWOVLTxt7j8PBwzGjtKMqYRTINtDo8uJi/0vcUc5D7SoHWAcx
	Foxu8S08dyKL/9U/xeOSDglNqGwh//jAGAyqQjqQOTOIc=
X-Gm-Gg: ASbGncumVVtH0L9Vov6Ul/Odtk7GJ2JMsZm9zGGihPdNP2S7C72rBE0mRJRcx8yF6gE
	9EIHi9Z0eTcD976ueG4aaYm14LUDONZkprUT/ZlVnWYVo2bMdSp7UzHCu+fh9J9igtJda5juzFW
	nsYQJ41CqfsE5xLBynGw5L6p5nktA/f1Bf3mDWso7kePx20l6M7Vi5
X-Received: by 2002:a17:90b:4a4d:b0:341:8ad7:5f7a with SMTP id 98e67ed59e1d1-3436cbf8ee9mr14324782a91.18.1762868404463;
        Tue, 11 Nov 2025 05:40:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwgaH141MDvs6mYUD4Q5X8qYaZSdZRIsl83tR7MOsbdijrnHMQlgky3eynMPNNlWF7eVvF8AMO1yx39XcY/Yc=
X-Received: by 2002:a17:90b:4a4d:b0:341:8ad7:5f7a with SMTP id
 98e67ed59e1d1-3436cbf8ee9mr14324690a91.18.1762868403713; Tue, 11 Nov 2025
 05:40:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <3vbq76dpjnadfrnufojq4zqiv7p5p555rhxfx6yoncc354p3lk@ohcs3ldhuoao> <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
In-Reply-To: <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 15:39:52 +0200
X-Gm-Features: AWmQ_blXQdwosO6i2_FdIYV6vtohi336OUCTfZYSjCdbYIy9ZUUucC_8UFt7TfE
Message-ID: <CAO9ioeXSXwm03e_j8TuXz2Sqr1J2n3uEFH6dJoKVyE+hJx+woQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEwOSBTYWx0ZWRfX2ny2FGgnur/g
 OMZ3apKa/IlDVocNry7KYGZy/+j8NvmS6fbxiQihJITRmAoWvQXguIEjcz7U3l8e4wJBEUzEtqo
 ljCLAGNnW5TV7ATCtFCSme8yxIzX3vhEiQasNKDxJT8K+XOK0oXV56EjhoIPCWPhTQYxc/2/M1b
 /Y7wGCg/qe900Dznmwm8kZ4uYhTyFpleQbAKelCNQGUvIT6c0REyuxo4F/lMzPfN1APAm6djqx1
 cpiq7PGsEQ0yo2GNvu4o0g3gPrjIx3dnnUF5zI+fPKqmnWFB5grapqLh2bID6zAmtx33DPtIkkX
 5JMZrrjcL2J8/N28vAbWSrdB0IqAdwX+VaB7+s81ee4m/cf5g6jN2EWVGBX4BleyyWBlfvBRGnc
 Kvuil2zk8Vl9pqWX+9J+VluWGnNxKg==
X-Proofpoint-ORIG-GUID: mnp2zu_SmPoKv9CyzagTyPPbAs7z21Xs
X-Proofpoint-GUID: mnp2zu_SmPoKv9CyzagTyPPbAs7z21Xs
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=69133cb5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=V0DlmUR_jgQx3hgdKxUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110109

On Tue, 11 Nov 2025 at 14:43, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 11/11/2025 4:08 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 07, 2025 at 03:19:35PM +0530, Vikash Garodia wrote:
> >> Upcoming Qualcomm kaanapali platform have a newer generation of video
> >> IP, iris4 or vpu4. The hardware have evolved mostly w.r.t higher number
> >> of power domains as well as multiple clock sources. It has support for
> >> new codec(apv), when compared to prior generation.
> >>
> >>  From previous version of this series, the kaanapali binding patch(#1/8)
> >> and the compatible patch(#8/8) have been dropped. The discussion for
> >> this is captured here [1].
> >> The series introducs buffer calculation and power sequence for vpu4. It
> >> prepares for vpu4 when kaanapali is enabled after the binding discussion
> >> is concluded.
> >>
> >>
> >> gstreamer test:
> >> Decoders validated with below commands, codec specific:
> > Why not just run the fluster testsuite?
> >
>
> yeah, fluster can also be executed. Individual codec commands were
> explicitly called out incase someone wants to run standalone gst pipeline.

Please switch to fluster (in addition to Gst), ideally running all
test cases for a codec. While enabling SC7280 support I found that
there are enough corner cases which are being ignored by the driver.
One additional bonus is that fluster runs several process in parallel
by default, catching issues caused by several decode threads running
in parallel.

>
> >> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
> >> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
> >> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> >>
> >> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
> >> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
> >> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> >>
> >> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
> >> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
> >> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> >>
> >> Encoders validated with below commands:
> >> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> >> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
> >> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> >> location=<output_file.h264>
> >>
> >> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> >> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc
> >> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> >> location=<output_file.hevc>
>
> Regards,
> Vikash



-- 
With best wishes
Dmitry

