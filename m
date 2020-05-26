Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9A61E1BD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 09:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgEZHDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 03:03:52 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53131 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731436AbgEZHDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 03:03:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dTclj6RswFjnUdTcpjebLd; Tue, 26 May 2020 09:03:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590476628; bh=0kXAkIhbXptFYgFRJWtoCtz7iA4IcdHi+f8YJW692hk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=B5QkVLst8+j5DVXFsTIEir01KJ1/NMcSTAnSbdbSgUABvWnS5E4sq0A6MjSsKRMPH
         Zr0ahpmWBNwylX+FAIVnMi2uvVEdLNrfPc+F0my4c4Bpr3XMlqBWg+75gnNTufA22u
         wgp9578mdHMurl2aQympWa3GGh3qqssHjTr7/OWHb5D+/aJO2dzlpZXiSWyNWIulu8
         8jQGSCT3hsptPz2vUX2WakqMzQ3O9xv9O7jiXOVNmRCbZng6T8D28/Y4G4io4ddb/c
         aYzP6peDbZ57rIYB0nn1zB8nSdt3PabZbjhRpMRrjzbnI+JYvyup7fhuXXs4hQtuqh
         DQs8giybdwzqw==
Subject: Re: [RFC PATCH 0/3] METADATA design using V4l2 Request API
To:     dikshita@codeaurora.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, sakari.ailus@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        linux-media-owner@vger.kernel.org
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
 <66208196d7668fe184f6c9d8c6c69c8b@codeaurora.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7d11d3ba-7a76-1b18-c7c6-d9efc5de1500@xs4all.nl>
Date:   Tue, 26 May 2020 09:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <66208196d7668fe184f6c9d8c6c69c8b@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBueupDa55MQv2WHpZ1p8Yac3h6A33f9Y6tcGYTDATu2d4lKuHE0607/uuLPD0ezKFIf8I3VGm0xF/xvRR+K/EoSEkPJ5cBMwiM9+7++tE04himiCy+D
 x70CMv4f/klWlsF32vtxbwPuqyrZOTt1kyiZUdYsYlLSaiUOVVZ57mrsjnAQc4DtU5zOfztJ+Uu6cU0ayLngkUCTF+Bb6qc+Ja6Eu3+O5tX09gDfKsWNPXsu
 3fdM5ZnILePcM2nT6q39xgxLgia9N31dqIsXDxxFfaxuz88aAmezNv6PV2U0st9tEr7mBNVl/PJLGYtMKQ/cGfKsAXHjHKy8KVRqhGdlvt4SoqGY8fUyrhOL
 xcltwyWD15rQ2i5bIQEllXo8HSifhKhkcjob07HTtweh/E7rryQW4JDbDP3Q1Le23dH2ctAxozD/pOQx4pXKFhcfBv/qRx+8AMzlf24N0sM7EInK4xCYgq+V
 XcNwmZhL58DNI1dzp5P3de4vuUqkAdVIj6rouOsPAM6KNzkXpJJLbgjHuhk=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/05/2020 08:31, dikshita@codeaurora.org wrote:
> Hi,
> 
> A gentle reminder for the review.

It's on my TODO list. I hope to get to it this week or next week at the
latest.

Regards,

	Hans

> 
> On 2020-05-08 11:51, Dikshita Agarwal wrote:
>> There are many commercialized video use cases which needs metadata info
>> to be circulated between v4l2 client and v4l2 driver.
>>
>> METADATA has following requirements associated:
>> •Metadata is an optional info available for a buffer. It is not
>> mandatorily for every buffer.
>>  For ex. consider metadata ROI (Region Of Interest). ROI is specified
>> by clients to indicate
>>  the region where enhanced quality is desired. This metadata is given
>> as an input information
>>  to encoder output plane. Client may or may not specify the ROI for a
>> frame during encode as
>>  an input metadata. Also if the client has not provided ROI metadata
>> for a given frame,
>>  it would be incorrect to take the metadata from previous frame. If the 
>> data and
>>  metadata is asynchronous, it would be difficult for hardware to decide 
>> if it
>>  needs to wait for metadata buffer or not before processing the input
>> frame for encoding.
>> •Synchronize the buffer requirement across both the video node/session
>>  (incase metadata is being processed as a separate v4l2 video 
>> node/session).
>>  This is to avoid buffer starvation.
>> •Associate the metadata buffer with the data buffer without adding any
>> pipeline delay
>>  in waiting for each other. This is applicable both at the hardware
>> side (the processing end)
>>  and client side (the receiving end).
>> •Low latency usecases like WFD/split rendering/game streaming/IMS have
>> sub-50ms e2e latency
>>  requirements, and it is not practical to stall the pipeline due to
>> inherent framework latencies.
>>  High performance usecase like high-frame rate playback/record can
>> lead to frame loss during any pipeline latency.
>>
>> To address all above requirements, we used v4l2 Request API as 
>> interlace.
>>
>> As an experiment, We have introduced new control
>> V4L2_CID_MPEG_VIDEO_VENUS_METADATA
>> to contain the METADATA info. Exact controls can be finalized once the
>> interface is discussed.
>>
>> For setting metadata from userspace to kernel, let say on encode output 
>> plane,
>> following code sequence was followed
>> 1. Video driver is registering for media device and creating a media
>> node in /dev
>> 2. Request fd is allocated by calling MEDIA_IOC_REQUEST_ALLOC IOCTL on 
>> media fd.
>> 3. METADATA configuration is being applied on request fd using
>> VIDIOC_S_EXT_CTRLS IOCTL
>>    and the same request fd is added to buf structure structure before
>> calling VIDIOC_QBUF on video fd.
>> 4. The same request is queued through MEDIA_REQUEST_IOC_QUEUE IOCTL to
>> driver then, as a result
>>    to which METADATA control will be applied to buffer through S_CTRL.
>> 5. Once control is applied and request is completed,
>> MEDIA_REQUEST_IOC_REINIT IOCTL is called
>>    to re-initialize the request.
>>
>> We could achieve the same on capture plane as well by removing few
>> checks present currently
>> in v4l2 core which restrict the implementation to only output plane.
>>
>> We profiled below data with this implementation :
>> 1. Total time taken ( round trip ) for setting up control data on video 
>> driver
>>    with VIDIOC_S_EXT_CTRLS, QBUF and Queue Request: 737us
>> 2. Time taken for first QBUF on Output plane to reach driver with
>> REQUEST API enabled (One way): 723us
>> 3. Time taken for first QBUF on Output plane to reach driver without
>> REQUEST API (One way) : 250us
>> 4. Time taken by each IOCTL to complete ( round trip ) with REQUEST
>> API enabled :
>>     a. VIDIOC_S_EXT_CTRLS : 201us
>>     b. VIDIOC_QBUF : 92us
>>     c. MEDIA_REQUEST_IOC_QUEUE: 386us
>>
>> Kindly share your feedback/comments on the design/call sequence.
>> Also as we experimented and enabled the metadata on capture plane as
>> well, please comment if any issue in
>> allowing the metadata exchange on capture plane as well.
>>
>> Reference for client side implementation can be found at [1].
>>
>> Thanks,
>> Dikshita
>>
>> [1]
>> https://git.linaro.org/people/stanimir.varbanov/v4l2-encode.git/log/?h=dikshita/request-api
>>
>> Dikshita Agarwal (3):
>>   Register for media device
>>     - Initialize and register for media device
>>     - define venus_m2m_media_ops
>>     - Implement APIs to register/unregister media controller.
>>   Enable Request API for output buffers
>>     - Add dependency on MEDIA_CONTROLLER_REQUEST_API in Kconfig.
>>     - Initialize vb2 ops buf_out_validate and buf_request_complete.
>>     - Add support for custom Metadata control
>> V4L2_CID_MPEG_VIDEO_VENUS_METADATA
>>     - Implemeted/Integrated APIs for Request setup/complete.
>>   Enable Request API for Capture Buffers
>>
>>  drivers/media/common/videobuf2/videobuf2-v4l2.c |   4 +-
>>  drivers/media/platform/Kconfig                  |   2 +-
>>  drivers/media/platform/qcom/venus/core.h        |  36 ++++
>>  drivers/media/platform/qcom/venus/helpers.c     | 247 
>> +++++++++++++++++++++++-
>>  drivers/media/platform/qcom/venus/helpers.h     |  15 ++
>>  drivers/media/platform/qcom/venus/venc.c        |  63 +++++-
>>  drivers/media/platform/qcom/venus/venc_ctrls.c  |  61 +++++-
>>  drivers/media/v4l2-core/v4l2-ctrls.c            |  10 +
>>  drivers/media/v4l2-core/v4l2-mem2mem.c          |  17 +-
>>  include/media/v4l2-ctrls.h                      |   1 +
>>  include/media/venus-ctrls.h                     |  22 +++
>>  11 files changed, 465 insertions(+), 13 deletions(-)
>>  create mode 100644 include/media/venus-ctrls.h

